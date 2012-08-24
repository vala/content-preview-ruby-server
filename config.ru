require File.dirname(__FILE__) + '/router'
require File.dirname(__FILE__) + '/content_preview'
require 'json'
require 'rack/cors'

use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Lint
#use Rack::Static, :urls => ["/static"]

use Rack::Cors do
 allow do
  origins 'http://localhost:3000'
  resource %r{/},
    :headers => ['Origin', 'Accept', 'Content-Type'],
    :methods => [:get, :post]
 end
end

run Router.new