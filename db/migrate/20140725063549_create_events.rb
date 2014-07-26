class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :action
      t.integer :user_id
      t.integer :temp_user_id

      t.timestamps
    end
  end
end
