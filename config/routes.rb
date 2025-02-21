Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  get("/directors", { :controller => "directors", :action => "index" })
  post("/insert_director", { :controller => "directors", :action => "insert" })
  get("/delete_director/:director_id", { :controller => "directors", :action => "delete" })
  post("/modify_director/:director_id", { :controller => "directors", :action => "modify" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/insert_movie", { :controller => "movies", :action => "insert" })
  get("/delete_movie/:movie_id", { :controller => "movies", :action => "delete" })
  post("/modify_movie/:movie_id", { :controller => "movies", :action => "modify" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/insert_actor", { :controller => "actors", :action => "insert" })
  get("/delete_actor/:actor_id", { :controller => "actors", :action => "delete" })
  post("/modify_actor/:actor_id", { :controller => "actors", :action => "modify" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
