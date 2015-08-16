Rails.application.routes.draw do
  get 'readings/index'

  get 'readings/show'

  get 'readings/create'

  get 'readings/update'

  get 'readings/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  resources :users do
    resources :readings
  end
end
