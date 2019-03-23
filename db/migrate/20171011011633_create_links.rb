class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.integer :type
      t.text :content
      t.references :catalog, foreign_key: true

      t.timestamps
    end
  end
end
