class AddConfirmableToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end
    add_index :users, :confirmation_token, :unique => true 
  end
end
