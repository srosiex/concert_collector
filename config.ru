require_relative './config/env'


user Rack::MethodOverride
user SessionsController
run ApplicationController