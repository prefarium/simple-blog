class CommentsController < ApplicationController
  include CommentsHelper
  add_flash_types :success

  def create
    @comment            = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article), success: 'Comment is added'
  end
end
