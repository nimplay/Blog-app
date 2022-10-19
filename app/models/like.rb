class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'user', foreign_key: 'authorId'

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likesCounter)
  end

  private :update_likes_counter
end
