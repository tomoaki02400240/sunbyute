class CreateShopDescs < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_descs do |t|
      t.string :description
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
