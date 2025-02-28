class AddReferencesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :user, foreign_key: true
    add_reference :tickets, :user, foreign_key: true
    add_reference :tickets, :project, foreign_key: true
  end
end
