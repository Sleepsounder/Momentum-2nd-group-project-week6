class AddUserIdToTwerps < ActiveRecord::Migration[5.2]
  def change
    add_column :twerps, :user_id, :integer
  end
end
