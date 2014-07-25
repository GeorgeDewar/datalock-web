class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.text :name

      t.timestamps
    end
  end
end
