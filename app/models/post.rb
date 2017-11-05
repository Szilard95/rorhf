class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :saves, class_name: 'Save'
  has_many :upvotes

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
end
