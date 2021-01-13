class AddI18nLanguageAbbreviationsToLocales < ActiveRecord::Migration[6.0]
  def change
    add_column :locales, :locale, :string
  end
end
