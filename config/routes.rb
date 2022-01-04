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
    put    '/delete_ruby_skill/', to: 'ruby_skills#destroy'

    # rails_skills
    get    '/list_rails_skills',   to: 'rails_skills#index'
    get    '/show_rails_skill/',   to: 'rails_skills#show'
    put    '/update_rails_skill/', to: 'rails_skills#update'
    post   '/create_rails_skill/', to: 'rails_skills#create'
    put    '/delete_rails_skill/', to: 'rails_skills#destroy'

    # react_nextjs_skills
    get    '/list_react_next_js_skills',    to: 'react_and_next_js_skills#index'
    get    '/show_next_js_skills/',         to: 'react_and_next_js_skills#show'
    put    '/update_react_next_js_skills/',  to: 'react_and_next_js_skills#update'
    post   '/create_react_next_js_skills/', to: 'react_and_next_js_skills#create'
    put    '/delete_react_next_js_skills/', to: 'react_and_next_js_skills#destroy'

    # mysql_skills
    get    '/list_mysql_skills',   to: 'mysql_skills#index'
    get    '/show_mysql_skill/',   to: 'mysql_skills#show'
    put    '/update_mysql_skill/', to: 'mysql_skills#update'
    post   '/create_mysql_skill/', to: 'mysql_skills#create'
    put    '/delete_mysql_skill/', to: 'mysql_skills#destroy'

    # ec2_skills
    get    '/list_ec2_skills',   to: 'ec2_skills#index'
    get    '/show_ec2_skill/',   to: 'ec2_skills#show'
    put    '/update_ec2_skill/', to: 'ec2_skills#update'
    post   '/create_ec2_skill/', to: 'ec2_skills#create'
    put    '/delete_ec2_skill/', to: 'ec2_skills#destroy'

    # ecs_skills
    get    '/list_ecs_skills',   to: 'ecs_skills#index'
    get    '/show_ecs_skill/',   to: 'ecs_skills#show'
    put    '/update_ecs_skill/', to: 'ecs_skills#update'
    post   '/create_ecs_skill/', to: 'ecs_skills#create'
    put    '/delete_ecs_skill/', to: 'ecs_skills#destroy'

    # s3_skills
    get    '/list_s3_skills',   to: 's3_skills#index'
    get    '/show_s3_skill/',   to: 's3_skills#show'
    put    '/update_s3_skill/', to: 's3_skills#update'
    post   '/create_s3_skill/', to: 's3_skills#create'
    put    '/delete_s3_skill/', to: 's3_skills#destroy'

    # rds_skills
    get    '/list_rds_skills',   to: 'rds_skills#index'
    get    '/show_rds_skill/',   to: 'rds_skills#show'
    put    '/update_rds_skill/', to: 'rds_skills#update'
    post   '/create_rds_skill/', to: 'rds_skills#create'
    put    '/delete_rds_skill/', to: 'rds_skills#destroy'
  end
end