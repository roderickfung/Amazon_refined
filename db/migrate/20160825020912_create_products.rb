class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
