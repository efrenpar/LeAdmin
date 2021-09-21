class CreateHasProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :has_products do |t|
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
