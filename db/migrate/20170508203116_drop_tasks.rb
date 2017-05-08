class DropTasks < ActiveRecord::Migration[5.1]
  def up
    drop_table(:tasks)
  end

  def down
    fail ActiveRecord::IrreversibleMigration
 end
end
