class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def insert
    name = params.fetch("query_name")
    dob = params.fetch("query_dob")
    bio = params.fetch("query_bio")
    image = params.fetch("query_image")
    x = Director.new
    x.name = name
    x.dob = dob
    x.bio = bio
    x.image = image
    x.save
    redirect_to("/directors")
  end
  
  def delete
    director_id = params.fetch("director_id")
    matching_director = Director.where({ :id => director_id }).first
    matching_director.destroy
    redirect_to("/directors")
  end

  def modify
    director_id = params.fetch("director_id")
    matching_directors = Director.where({ :id => director_id })
    @the_actor = matching_directors.at(0)
    name = params.fetch("query_name")
    dob = params.fetch("query_dob")
    bio = params.fetch("query_bio")
    image = params.fetch("query_image")
    @the_actor.name = name
    @the_actor.dob = dob
    @the_actor.bio = bio
    @the_actor.image = image
    @the_actor.save
    redirect_to("/directors/#{director_id}")
  end
end
