class User < ApplicationRecord
  has_many :posts, foreign_key: 'authorId'
  has_many :comments, foreign_key: 'authorId'
  has_many :likes, foreign_key: 'authorId'

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :postCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.reverse_order.first(3)
  end
end
