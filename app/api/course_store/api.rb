class CourseStore::API < Grape::API
  mount CourseStore::V1::PurchaseRecords
end