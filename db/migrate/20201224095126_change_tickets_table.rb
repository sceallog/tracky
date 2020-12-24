class ChangeTicketsTable < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.remove :related_project_id
    end
  end
  change_column_null :tickets, :resolution_summary, true
end
