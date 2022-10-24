class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:comments_counter)
  end

  private :update_comment_counter
end
