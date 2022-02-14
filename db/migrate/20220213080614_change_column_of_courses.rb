class ChangeColumnOfCourses < ActiveRecord::Migration[6.1]
  def change
    change_column_default :courses, :is_available, false
  end
end
