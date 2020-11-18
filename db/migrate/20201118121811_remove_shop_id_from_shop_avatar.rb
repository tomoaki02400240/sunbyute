class RemoveShopIdFromShopAvatar < ActiveRecord::Migration[5.2]
  def change
    remove_column :shop_avatars, :shop_id, foreign_key: true
  end
end
