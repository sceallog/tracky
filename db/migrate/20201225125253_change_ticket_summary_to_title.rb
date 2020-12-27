class ChangeTicketSummaryToTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :summary, :title
  end
end
