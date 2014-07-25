class CreateTempUsers < ActiveRecord::Migration
  def change
    create_table :temp_users do |t|
      t.text :name
      t.text :pin
      t.timestamp :expiry_at

      t.timestamps
    end
  end
end
