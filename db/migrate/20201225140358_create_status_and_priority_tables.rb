class CreateStatusAndPriorityTables < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :name, null: false
    end

    add_reference :tickets, :status, foreign_key: true

    create_table :priorities do |t|
      t.string :name, null: false
    end

    add_reference :tickets, :priority, foreign_key: true

    change_table :tickets do |t|
      t.remove :priority, :status
    end
  end
end
