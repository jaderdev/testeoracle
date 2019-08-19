Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :task
  get '/task/filtered', action: :filter, controller: 'tasks', as: 'task_filter'
end
