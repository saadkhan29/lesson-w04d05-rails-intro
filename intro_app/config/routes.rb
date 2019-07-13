Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about', to: 'application#about'
  # HTTP VERB + URL PATH, CONTROLLER#METHOD

  get 'todos', to: 'todos#index' 

end
