class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.text :code
      t.text :name

      t.timestamps
    end
  end
end
