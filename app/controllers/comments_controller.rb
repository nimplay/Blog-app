class CommentsController < ApplicationController
  def new
    @post = Comment.new
  end
end
