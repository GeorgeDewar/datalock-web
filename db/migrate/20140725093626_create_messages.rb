class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :protocol
      t.timestamp :confirmed_at
      t.text :success
      t.text :payload
      t.timestamp :expiry_at
      t.integer :command_id

      t.timestamps
    end
  end
end
