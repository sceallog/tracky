class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :summary, null: false
      t.text :description, null: false
      t.integer :identified_by_user_id, null: false
      t.date :date_identified, null: false
      t.integer :related_project_id, null: false
      t.integer :assigned_to_user_id
      t.integer :status, null: false, default: 1
      t.string :priority, default: 'low'
      t.date :target_resolution_date, null: false
      t.date :actual_resolution_date
      t.text :resolution_summary, null: false

      t.timestamps
    end
  end
end
