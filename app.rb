require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/division'
require './lib/employee'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

Employee.all.each do |employee|
  employee.destroy
end
Division.all.each do |division|
  division.destroy
end

get('/') do
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end

post('/division_info') do
  division = params.fetch('division_name')
  @division = Division.create(:name => division)
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end

post('/employee_new') do
  employee = params.fetch('employee_name')
  division_id = params['id'].to_i
  new_employee = Employee.create(:name => employee, :division_id => division_id)
# binding.pry
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end

get('/employee_info/:id') do
  em_id = params['id'].to_i
  @employee = Employee.find(em_id)
  @division = Division.find(@employee.division_id)
  erb(:employee_info)
end

get('/division_info/:id') do
  div_id = params['id'].to_i
  @division = Division.find(div_id)
  # em_id = params['id'].to_i
  # @employee = Employee.find(em_id)
  # @employees = @division.employees
  erb(:division_info)
end
