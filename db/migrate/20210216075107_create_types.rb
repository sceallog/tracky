class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name

      t.timestamps
    end
    add_reference :tickets, :type, foreign_key: true
  end
end
