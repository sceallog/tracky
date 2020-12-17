class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :role, :integer, null: false, default: 0
    add_column :users, :assigned_project, :integer
  end
end
