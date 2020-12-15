class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :role, :integer, null: false
    add_column :users, :assigned_project, :integer
  end
end
