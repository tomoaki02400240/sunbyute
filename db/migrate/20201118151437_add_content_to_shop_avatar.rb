class AddContentToShopAvatar < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_avatars, :content, :text
  end
end
