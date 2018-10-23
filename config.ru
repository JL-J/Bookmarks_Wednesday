require 'rack'
require_relative 'MyApp'

# configure.before(:each) do
#   ENV["database"] = "bookmark"
# end

run MyApp
