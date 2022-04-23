require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.test_framework false
    end

    # サービスをオートロードする
    config.autoload_paths += %W(#{config.root}/app/services)
    config.autoload_paths += %W(#{config.root}/app/repositories)
    config.autoload_paths += %W(#{config.root}/app/repositories/me)
    config.autoload_paths += %W(#{config.root}/app/repositories/rails_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/ruby_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/react_or_nextjs_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/mysql_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/ec2_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/ecs_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/rds_skill)
    config.autoload_paths += %W(#{config.root}/app/repositories/s3_skill)
    config.autoload_paths += %W(#{config.root}/app/queries)
    config.autoload_paths += %W(#{config.root}/app/queries/*)

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.session_store :cookie_store, key: '_session_inter'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options

    # Added middleware manually.
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
               :headers => :any,
               :expose => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
               :methods => [:get, :post, :options, :delete, :put]
      end
    end
  end
end
