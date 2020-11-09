class AddIndexToShopsEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :shops, :email, unique: true
  end
end
