class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :email
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
