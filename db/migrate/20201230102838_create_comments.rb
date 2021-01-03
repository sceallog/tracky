class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :message
      t.belongs_to :ticket, index: true, foreign_key: true

      t.timestamps
    end
  end
end
