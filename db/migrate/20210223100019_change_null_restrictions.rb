class ChangeNullRestrictions < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:statuses, :name, true)
    change_column_null(:priorities, :name, true)
    change_column_null(:projects, :name, false)
    change_column_null(:projects, :description, false)
    change_column_null(:projects, :start_date, false)
    change_column_null(:comments, :message, false)
    change_column_null(:comments, :commenter, false)
  end
end
