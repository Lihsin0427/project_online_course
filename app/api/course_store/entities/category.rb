module CourseStore
  module Entities
    class Category < Grape::Entity

      expose :name, as: :categary_name

    end
  end
end