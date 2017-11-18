class Comment < ApplicationRecord
  attr_accessor :level
  belongs_to :post
  belongs_to :user
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Comment', optional: true

  has_many :upvotes, as: :item, dependent: :destroy

  has_many :upvoters,
           source: :user,
           through: :upvotes

  validates :body, presence: true
end
