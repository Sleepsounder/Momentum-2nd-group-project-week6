class CreateTwerps < ActiveRecord::Migration[5.2]
  def change
    create_table :twerps do |t|
      t.string :twerp
      t.integer :numfavs

      t.timestamps
    end
  end
end
