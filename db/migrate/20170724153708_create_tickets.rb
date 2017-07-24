class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.attachment :ticket
      t.string :tess_text

      t.timestamps
    end
  end
end
