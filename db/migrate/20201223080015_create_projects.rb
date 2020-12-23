class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :target_end_date
      t.date :actual_end_date

      t.timestamps
    end
  end
end
