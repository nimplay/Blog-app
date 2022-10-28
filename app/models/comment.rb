class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postId'
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:commentsCounter)
  end

  private :update_comment_counter
end
