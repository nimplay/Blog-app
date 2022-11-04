class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

        # devise :database_authenticatable, :registerable,
        # :recoverable, :rememberable, :validatable
        # devise :database_authenticatable, :registerable,
        # :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :posts, foreign_key: 'authorId'
  has_many :comments, foreign_key: 'authorId'
  has_many :likes, foreign_key: 'authorId'

  # validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  # validates :postCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def admin?
    role == 'admin'
  end

  def last_three_posts
    posts.reverse_order.first(3)
  end

  def jwt_payload
    super.merge('foo' => 'bar')
  end
end
