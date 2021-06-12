Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }

    # posts
    get    '/list-post',          to: 'posts#index'
    get    '/detail-post/:id',        to: 'posts#show'
    # get    '/:user_id/edit',          to: 'users#edit'
    # post   '/:user_id/update',            to: 'users#update'
    # get    '/:user_id/update_before_check', to: 'users#update_before_check'
    # get    '/:user_id/delete_before_check', to: 'users#destroy_before_check'
    # delete '/delete',         to: 'users#destroy'

    # tasks
    get    '/list-task',           to: 'tasks#index'
    get    '/detail-task/:id',     to: 'tasks#show'
    put    '/update-task/:id',     to: 'tasks#update'
    post   '/create-task/:id',     to: 'tasks#create'
    delete '/delete-task/:id',     to: 'tasks#destroy'

    # users
    # get    '/:user_id',          to: 'users#show'
    # get    '/:user_id/edit',          to: 'users#edit'
    # post   '/:user_id/update',            to: 'users#update'
    # get    '/:user_id/update_before_check', to: 'users#update_before_check'
    # get    '/:user_id/delete_before_check', to: 'users#destroy_before_check'
    # delete '/delete',         to: 'users#destroy'

    # 認証てすと
    get    'tasks',          to: 'tasks#x_index'
    get    '/tasks/:id',     to: 'tasks#x_show'
    post   '/tasks/:id',     to: 'tasks#x_create'
    put    '/tasks/:id',     to: 'tasks#x_update'
    delete '/tasks/:id',     to: 'tasks#x_destroy'
  end
  # resources :posts
end