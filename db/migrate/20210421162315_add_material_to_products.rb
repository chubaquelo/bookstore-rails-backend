class AddMaterialToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :material, :string
  end
end
