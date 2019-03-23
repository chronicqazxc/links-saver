class AddPositionToCatalogs < ActiveRecord::Migration[5.1]
  def change
    add_column :catalogs, :position, :integer
  end
end
