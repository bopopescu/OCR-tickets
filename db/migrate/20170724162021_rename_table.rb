class RenameTable < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.attachment :ticket_img
      t.string :tess_text

      t.timestamps
    end
  end
end
