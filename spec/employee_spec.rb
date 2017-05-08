require "spec_helper"

describe(Employee) do
  describe("#division_id") do
    it("returns the division id of an employee") do
      test_division = Division.create({:name => "division"})
      test_employee = Employee.create({:name => "Dominic", :division_id => test_division.id})
      expect(test_employee.division_id).to(eq(test_division.id))
    end
  end
end
