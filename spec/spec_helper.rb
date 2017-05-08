ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")

require("pry")

# RSpec.configure do |configure|
#   config.after(:each) do
#     Employee.all.each do |task|
#       task.destroy
#     end
#   end
# end
