module CourseStore
  module Entities
    class PurchaseRecord < Grape::Entity
      
      format_with(:datetime) do |time|
        time.to_s(:db) 
      end

      expose :p_price, as: :purchase_price
      expose :p_currency, as: :purchase_currency
      expose :p_validity_period, as: :purchase_validity_period

      with_options(format_with: :datetime) do
        expose :purchase_date
        expose :expiry_date
      end

    end
  end
end