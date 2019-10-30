require_relative './config/env'


use Rack::MethodOverride
use SessionController
use EventsController
run ApplicationController