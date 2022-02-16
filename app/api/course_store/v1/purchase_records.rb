module CourseStore
  module V1
    class PurchaseRecords < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!(message: e.message, status: 404)
      end

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
        route_param :url do
        #   requires :url, type: String
        # end
        
          get do
            course = Course.find_by!(url: params[:url])
            last_purchase = PurchaseRecord.where(user_id: current_user.id, course_id: course.id ).last

            if not last_purchase != nil && Time.now < last_purchase.expiry_date 
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

            else
              { message: 'You still have this course that has not expired.', status: 406 }
            end
          end
        end
      end

      resource :purchase_records do
        desc 'Purchase records of a user'

        get do

          purchase_records = current_user.purchase_records.includes(course: :category)
          
          a = []
          purchase_records.each do |p|
            a << p.course
          end

          a_u = a.uniq

          present a_u, with: CourseStore::Entities::Course
        end
      end
    end
  end
end