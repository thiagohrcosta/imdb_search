class MoviesController < ApplicationController
  def index
    if params[:query]
      query = "title @@ :query OR synopsis @@ :query"
      @movies = Movie.where(query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
