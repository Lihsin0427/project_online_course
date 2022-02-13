class ChangeCategoryInCourse < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :category
    add_reference :courses, :category, index: true
    add_index :courses, :url, unique: true
    change_column :courses, :price, :decimal, precision: 10, scale: 2
  end
end
