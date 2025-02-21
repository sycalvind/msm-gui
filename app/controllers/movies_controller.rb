class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert
    title = params.fetch("query_title")
    year = params.fetch("query_year")
    duration = params.fetch("query_duration")
    description = params.fetch("query_description")
    image = params.fetch("query_image")
    director_id = params.fetch("query_director_id")
    x = Movie.new
    x.title = title
    x.year = year
    x.duration = duration
    x.description = description
    x.image = image
    x.director_id = director_id
    x.save
    redirect_to("/movies")
  end

  def delete
    movie_id = params.fetch("movie_id")
    matching_movie = Movie.where({ :id => movie_id }).first
    matching_movie.destroy
    redirect_to("/movies")
  end

  def modify
    movie_id = params.fetch("movie_id")
    matching_movies = Movie.where({ :id => movie_id })
    @the_movie = matching_movies.at(0)
    title = params.fetch("query_title")
    year = params.fetch("query_year")
    duration = params.fetch("query_duration")
    description = params.fetch("query_description")
    image = params.fetch("query_image")
    dir_id = params.fetch("query_director")
    @the_movie.title = title
    @the_movie.year = year
    @the_movie.duration = duration
    @the_movie.description = description
    @the_movie.image = image
    @the_movie.director_id = dir_id
    @the_movie.save
    redirect_to("/movies/#{movie_id}")
  end
end
