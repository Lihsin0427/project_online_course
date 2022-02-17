module CourseStore
  module Entities
    class Course < Grape::Entity

      expose :topic
      expose :price
      expose :currency
      expose :is_available
      expose :content
      expose :validity_period
      expose :category, merge: true, using: CourseStore::Entities::Category
      expose :url
      expose :purchase_records, using: CourseStore::Entities::PurchaseRecord

    end
  end
end