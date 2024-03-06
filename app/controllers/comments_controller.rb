class CommentsController < ApplicationController
  def index
    #@comments = Comment.all
  end

  def show
    @comment_map = Comment.find(params[:id]).hash_tree # Consider adding limit
  end
end
