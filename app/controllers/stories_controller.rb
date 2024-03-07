class StoriesController < ApplicationController
  # TODO: Implement handling for dead or deleted comments

  def index
    @stories = Story.last(30)
  end

  def show
    @story_map = Story.find(params[:id]).hash_tree # Consider adding limit
  end

  def search
    @stories = Story.search_by_title(params[:query])
  end
end
