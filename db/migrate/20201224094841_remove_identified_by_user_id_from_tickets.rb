class RemoveIdentifiedByUserIdFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :identified_by_user_id
  end
end
