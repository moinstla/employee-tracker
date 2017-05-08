class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table(:tasks) do |t|
      t.column(:name, :string)
    end
  end
end
