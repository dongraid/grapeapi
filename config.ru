# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# run Rails.application
# run User::API

# run Rack::URLMap.new('/rails' => Rails.application,
#                      '/grape' => User::API)

map '/rails' do
  run Rails.application
end
map '/grape' do
  run User::API
end