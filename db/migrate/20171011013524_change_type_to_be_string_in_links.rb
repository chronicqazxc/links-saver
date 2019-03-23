class ChangeTypeToBeStringInLinks < ActiveRecord::Migration[5.1]
  def change
    change_column :links, :type, :string
  end
end
