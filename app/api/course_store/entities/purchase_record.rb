module CourseStore
  module Entities
    class PurchaseRecord < Grape::Entity
      expose :id
      expose :user_id
      expose :p_topic
      expose :p_price
      expose :p_currency
      expose :p_category
      expose :p_validity_period
      expose :purchase_date
      expose :expiry_date
    end
  end
end