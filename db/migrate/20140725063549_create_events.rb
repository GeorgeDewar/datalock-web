class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :action
      t.integer :user_id
      t.text     :user_type

      t.timestamps
    end
  end
end
