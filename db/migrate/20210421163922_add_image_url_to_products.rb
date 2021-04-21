class AddImageUrlToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_url, :string
  end
end
