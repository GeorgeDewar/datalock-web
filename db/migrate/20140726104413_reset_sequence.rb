class ResetSequence < ActiveRecord::Migration
  def change
    execute "ALTER SEQUENCE temp_users_id_seq RESTART WITH 50;"
  end
end
