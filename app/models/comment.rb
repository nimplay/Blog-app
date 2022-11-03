class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postId'
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'

  after_save :update_comment_counter
  after_destroy :update_comment_counter

  def update_comment_counter
    post.update(commentsCounter: post.comments.count)
  end

  private :update_comment_counter
end
