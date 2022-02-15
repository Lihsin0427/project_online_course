module CourseStore
  module V1
    class PurchaseRecords < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :purchase_records do
        desc 'Create a purchase record'
        params do
          requires :course_id, type: Integer
        end
        
        get do
          course = Course.find_by(id: params[:course_id])

          if course.is_available?

            PurchaseRecord.create!({
              user_id: current_user.id,
              course_id: course.id,
              p_topic: course.topic,
              p_price: course.price,
              p_currency: course.currency,
              p_category:  course.category.name,
              p_validity_period: course.validity_period,
              purchase_date: Time.now,
              expiry_date: Time.now + course.validity_period.day
            })

            # render json: { result: 'Purchase record created!' }
          # else
            # render json: { result: 'The course is not available!' }
          end

        end
      end
    end
  end
end