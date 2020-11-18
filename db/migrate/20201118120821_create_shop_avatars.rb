class CreateShopAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_avatars do |t|
      t.string :avatar

      t.timestamps
    end
  end
end
