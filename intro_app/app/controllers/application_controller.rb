class ApplicationController < ActionController::Base
  def about
    @name = 'Marc'
    @favorite_movies = ['Avengers', 'Imitation Game', 'Fight Club']
  end
end
