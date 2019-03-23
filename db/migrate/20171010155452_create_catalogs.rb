class CreateCatalogs < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
