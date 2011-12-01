# Rack Dispatcher

# Require your environment file to bootstrap Rails
require File.dirname(__FILE__) + '/config/environment'
require 'rack/openid'

use Rack::Session::Cookie
use Rack::OpenID
use EasyRackOpenID, :allowed_identifiers => ['https://www.google.com/accounts/o8/id']

run lambda {|env| [ 200, { 'Content-Type' => 'text/plain' }, [ 'Authenticated!' ] ] }

# Dispatch the request
run ActionController::Dispatcher.new

