class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def insert
    name = params.fetch("query_name")
    dob = params.fetch("query_dob")
    bio = params.fetch("query_bio")
    image = params.fetch("query_image")
    x = Actor.new
    x.name=name
    x.dob=dob
    x.bio=bio
    x.image=image
    x.save
    redirect_to("/actors")
  end

  def delete
    actor_id = params.fetch("actor_id")
    matching_actor = Actor.where({ :id => actor_id }).first
    matching_actor.destroy
    redirect_to("/actors")
  end

  def modify
    actor_id = params.fetch("actor_id")
    matching_actors = Actor.where({ :id => actor_id })
    @the_actor = matching_actors.at(0)
    name = params.fetch("query_name")
    dob = params.fetch("query_dob")
    bio = params.fetch("query_bio")
    image = params.fetch("query_image")
    @the_actor.name = name
    @the_actor.dob = dob
    @the_actor.bio = bio
    @the_actor.image = image
    @the_actor.save
    redirect_to("/actors/#{actor_id}")
  end
end
