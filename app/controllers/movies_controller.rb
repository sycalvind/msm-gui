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
end
