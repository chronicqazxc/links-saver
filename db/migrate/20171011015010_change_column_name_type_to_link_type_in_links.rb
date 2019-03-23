class ChangeColumnNameTypeToLinkTypeInLinks < ActiveRecord::Migration[5.1]
  def change
    rename_column :links, :type, :link_type
  end
end
