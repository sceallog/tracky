class ChangeUsersTable < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.rename :assigned_to_user_id, :submitted_by
      t.change :submitted_by, :string
    end
  end
end
