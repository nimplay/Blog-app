class Post < ApplicationRecord
  belongs_to :user, class_name: 'user'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :text, presence: true
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def five_most_recent_comments
    Comment.where(postId: self).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:postCounter)
  end
end
