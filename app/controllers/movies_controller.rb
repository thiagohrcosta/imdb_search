class MoviesController < ApplicationController
  def index
    if params[:query]
      @movies = Movie.search_by_title_and_synopsis(params[:query])
    else
      @movies = Movie.all
    end
  end
end
