class AddPositionToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :position, :integer
  end
end
