class CreateLocales < ActiveRecord::Migration[6.0]
  def change
    create_table :locales do |t|
      t.string :language

      t.timestamps
    end
    add_index :locales, :language, unique: true
    add_reference :users, :locale, foreign_key: true
  end
end
