class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :saves, class_name: 'Save'
  has_many :upvotes, as: :item

  has_many :upvoters,
           source: :user,
           through: :upvotes

  has_many :savers,
           source: :user,
           through: :saves

  def host
    return nil if url.nil?
    URI.parse(url).host ? URI.parse(url).host.downcase : nil
  end

  validates :title, presence: true
  validates :url, presence: true, unless: :has_body?
  validates :url, absence: true, if: :has_body?
  validates :body, presence: true, unless: :has_url?
  validates :body, absence: true, if: :has_url?

  private

  def has_body?
    !body.blank?
  end

  def has_url?
    !url.blank?
  end
end
