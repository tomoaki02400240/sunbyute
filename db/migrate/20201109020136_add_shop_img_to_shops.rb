class AddShopImgToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_img, :string
  end
end
