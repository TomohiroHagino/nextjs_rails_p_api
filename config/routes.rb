Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }

    # mes
    get    '/show_me',   to: 'mes#show'
    put    '/update_me', to: 'mes#update'

    # ruby_skills
    get    '/list_ruby_skills/',  to: 'ruby_skills#index'
    get    '/show_ruby_skill/',   to: 'ruby_skills#show'
    put    '/update_ruby_skill/', to: 'ruby_skills#update'
    post   '/create_ruby_skill/', to: 'ruby_skills#create'
    delete '/delete_ruby_skill/', to: 'ruby_skills#destroy'

    # rails_skills
    get    '/list_rails_skills',   to: 'rails_skills#index'
    get    '/show_rails_skill/',   to: 'rails_skills#show'
    put    '/update_rails_skill/', to: 'rails_skills#update'
    post   '/create_rails_skill/', to: 'rails_skills#create'
    delete '/delete_rails_skill/', to: 'rails_skills#destroy'

    # react_nextjs_skills
    get    '/list_react_next_js_skills',    to: 'react_and_next_js_skills#index'
    get    '/show_next_js_skills/',         to: 'react_and_next_js_skills#show'
    put    '/update_react_nextjs_skills/',  to: 'react_and_next_js_skills#update'
    post   '/create_react_next_js_skills/', to: 'react_and_next_js_skills#create'
    delete '/delete_react_next_js_skills/', to: 'react_and_next_js_skills#destroy'
  end
end