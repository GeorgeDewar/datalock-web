class CreateTempUsers < ActiveRecord::Migration
  def change
    create_table :temp_users do |t|
      t.text :namee
      t.text :pin
      t.timestamp :expiry_at

      t.timestamps
    end
  end
end
