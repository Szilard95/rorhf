class User < ApplicationRecord
  before_save :encrypt_password
  attr_accessor :password

  validates :name, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, if: :password_required?

  def password_required?
    self.new_record? || !password.blank?
  end

  has_many :posts
  has_many :comments
  has_many :saves, class_name: 'Save'
  has_many :upvotes

  has_many :upvoted_posts,
           -> {distinct},
           source: :item,
           source_type: Post.name,
           through: :upvotes

  has_many :upvoted_comments,
           -> {distinct},
           source: :item,
           source_type: Comment.name,
           through: :upvotes

  has_many :saved_posts,
           -> {distinct},
           source: :post,
           through: :saves

  def self.authenticate(name, pass)
    user = User.find_by_name(name)
    user && user.authenticated?(pass) ? user : nil
  end

  def authenticated?(pass)
    self.encrypted_password == User.encrypt(pass, self.salt)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end

  private

  def encrypt_password
    return if password.blank?
    if new_record?
      self.salt = SecureRandom.hex(16)
    end
    self.encrypted_password = User.encrypt(self.password, self.salt)
  end

end
