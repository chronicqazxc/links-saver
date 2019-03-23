class ChangeContentFormatInLinks < ActiveRecord::Migration[5.1]
  def change
    change_column :links, :content, :string
  end
end
