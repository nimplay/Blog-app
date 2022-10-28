class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postId'
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likesCounter)
  end

  private :update_likes_counter
end
