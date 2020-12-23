class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :title

      t.timestamps
    end

    add_reference :users, :role, foreign_key: { validate: false }
  end
end
