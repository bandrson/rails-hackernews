class StoriesController < ApplicationController
  def index
    @stories = Story.last(30)
  end

  def show
    @story_map = Story.find(params[:id]).hash_tree # Consider adding limit
  end
end
