class MoviesController < ApplicationController
  before_action :authenticate_user! , except: [:show, :index]
  def index
    if params[:looking_for]
      movie_title = params[:looking_for]
      url = CGI.escape("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API']}&language=ja&query=" + movie_title)
    else
      url = "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['TMDB_API']}&language=ja"
    end
    @movies = JSON.parse(Net::HTTP.get(URI.parse(url))) 
  end

  def show
    movie_id = params[:id]
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_API']}&language=ja"
    @movie = JSON.parse(Net::HTTP.get(URI.parse(url)))
  end
end
