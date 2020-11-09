class AddCityToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :city, foreign_key: true
  end
end
