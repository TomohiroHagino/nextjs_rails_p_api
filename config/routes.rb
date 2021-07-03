Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }

    # mes
    get    '/show_me/',   to: 'mes#show'
    put    '/update_me/', to: 'users#update'

    # ruby_skills
    get    '/list_ruby_skills/',   to: 'ruby_skills#index'
    get    '/show_ruby_skills/',   to: 'ruby_skills#show'
    put    '/update_ruby_skills/', to: 'ruby_skills#update'
    post   '/create_ruby_skills/', to: 'ruby_skills#create'
    delete '/delete_ruby_skills/', to: 'ruby_skills#destroy'

    # rails_skills
    get    '/list_rails_skills',    to: 'rails_skills#index'
    get    '/show_rails_skills/',   to: 'rails_skills#show'
    put    '/update_rails_skills/', to: 'rails_skills#update'
    post   '/create_rails_skills/', to: 'rails_skills#create'
    delete '/delete_rails_skills/', to: 'rails_skills#destroy'

    # react_nextjs_skills
    get    '/list_react_nextjs_skills',          to: 'react_and_nextjs_skills#index'
    get    '/show_nextjs_skills/:type/:id',      to: 'react_and_nextjs_skills#show'
    put    '/update_react_nextjs_skills/:type/', to: 'react_and_nextjs_skills#update'
    post   '/create_react_nextjs_skills/:type/', to: 'react_and_nextjs_skills#create'
    delete '/delete_react_nextjs_skills/:type/', to: 'react_and_nextjs_skills#destroy'
  end
end