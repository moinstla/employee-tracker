require 'sinatra'
require 'sinatra/reloader'
require 'sinatra-activerecord'
require './lib/division'
require './lib/employee'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
