require "capybara/rspec"
require "./app"
require "spec_helper"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("the home path", {:type => :feature}) do

  it("shows the list of all current Divisions on the page") do
    visit("/")
    test_division1 = Division.create(:name => "Information Technology")
    test_division2 = Division.create(:name => "Human Resources")
    visit("/")
    expect(page).to(have_content("Human Resources"))
  end

  it("shows the list of all current Employees on the page") do
    visit("/")
    # test_division1 = Division.create(:name => "Information Technology")
    test_employee1 = Employee.create(:name => "Mike")
    # test_employee1 = Employee.create(:name => "Mike", :division_id => test_division1.id)
    # test_employee2 = Employee.create(:name => "Margret", :division_id => test_division1.id)
    visit("/")
    expect(page).to(have_content("Mike"))
  end
end

describe("the add division path", {:type => :feature}) do
  it("allows the user to add a division") do
    visit("/")
    fill_in("division_name", :with => "Human Resources")
    click_button("Add Division")
    expect(page).to have_content("Human Resources")
  end
end

describe("the add employee path", {:type => :feature}) do
  it("allows the user to add an employee") do
    visit("/")
    fill_in("employee_name", :with => "Mike")
    click_button("Add Employee")
    expect(page).to have_content("Mike")
  end
end

describe("the employee info path", {:type => :feature}) do
  it("allows the user to navigate to an info page for a single employee") do
    visit("/")
    fill_in("employee_name", :with => "Mike")
    click_button("Add Employee")
    click_link("Mike")
    expect(page).to have_content("Mike")
  end
end

describe("the divisions info path", {:type => :feature}) do
  it("allows the user to navigate to an info page for a single division") do
    visit("/")
    fill_in("division_name", :with => "IT Dept")
    click_button("Add Division")
    click_link("IT Dept")
    expect(page).to have_content("IT Dept")
  end
end
