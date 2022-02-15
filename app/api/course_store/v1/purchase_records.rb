module CourseStore
  module V1
    class PurchaseRecords < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :purchase_records do
        desc 'Create a purchase record'
        params do
          # requires :
        end
        post do
          # authenticate!
          # purchase_records.create!({
          #   user: current_user,
          #   
          # })
        end
      end
    end
  end
end