class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :topic
      t.decimal :price
      t.string :currency
      t.string :category
      t.boolean :is_available
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
