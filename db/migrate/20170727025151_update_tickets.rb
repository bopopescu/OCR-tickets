class UpdateTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :tess_text
    add_column :tickets, :band, :string
    add_column :tickets, :venue, :string
    add_column :tickets, :city, :string
    add_column :tickets, :date, :date
  end
end
