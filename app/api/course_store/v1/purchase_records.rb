module CourseStore
  module V1
    class PurchaseRecords < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      helpers do

        def warden
          env['warden']
        end

        def authenticated
          if warden.authenticated?
            return true
          elsif params[:access_token] and
              User.find_for_token_authentication("access_token" => params[:access_token])
            return true
          elsif params[:xapp_token] and
              AccessGrant.find_access(params[:xapp_token])
            return true
          else
            error!('401 Unauthorized', 401)
          end
        end

        def current_user
          warden.user || User.find_for_token_authentication("access_token" => params[:access_token])
        end
      end

      before { authenticated }

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

          else
            { message: 'The course is not available.', status: 406 }
          end
        end
      end
    end
  end
end