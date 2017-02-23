class RenameColumn < ActiveRecord::Migration[5.0]
  def change
      rename_column :products, :pricing, :price
  end
end
