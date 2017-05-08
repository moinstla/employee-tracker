require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/division'
require './lib/employee'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

get('/') do
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end

post('/division') do
  division = params.fetch('division_name')
  @division = Division.create(:name => division)
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end

post('/employee') do
  employee = params.fetch('employee_name')
  @employee = Employee.create(:name => employee)
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end
