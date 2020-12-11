class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_image
      t.references :shop, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
