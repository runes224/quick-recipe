# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'devise'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
module Myapp
  class Application < Rails::Application
    Bundler.require(*Rails.groups)
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.template_engine = :slim # slimに変更
    config.generators do |g| #Rspecの設定 不要なテストファイルが作成されない設定
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end
    # 日本語化
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja # デフォルトのlocaleを日本語(:ja)にする

    # 以下の記述を追記する(設定必須)
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
