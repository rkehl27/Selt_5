Rottenpotatoes::Application.routes.draw do
  resources :movies

  post '/movies/search_tmdb'

  match '/add_to_db', to: 'movies#add_to_db', via: :post
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
