class AddShopIdToShopAvatar < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_avatars, :shop, foreign_key: true
  end
end
