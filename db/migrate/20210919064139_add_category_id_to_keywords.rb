class AddCategoryIdToKeywords < ActiveRecord::Migration[6.1]
  def change
    add_reference :keywords, :category, null: false, foreign_key: true
  end
end
