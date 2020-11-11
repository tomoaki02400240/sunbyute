class CreateShopContents < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_contents do |t|
      t.references :shop, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
