# frozen_string_literal: true
#
# workers Integer(ENV['WEB_CONCURRENCY'] || 2)
# threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
# threads threads_count, threads_count
#
# preload_app!
#
# rackup      DefaultRackup
# port        ENV['PORT']     || 3000
# environment ENV['RACK_ENV'] || 'development'
#
# on_worker_boot do
#   # Worker specific setup for Rails 4.1+
#   # See: https://devcenter.heroku.com/articles/
#   # deploying-rails-applications-with-the-puma-web-server#on-worker-boot
#   ActiveRecord::Base.establish_connection
# end
#
# worker_timeout 5000

# AWS用
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart

app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
