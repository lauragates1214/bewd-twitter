class AddUserIdToSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :user_id, :integer
    add_foreign_key :sessions, :users
  end
end
