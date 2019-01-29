module Concerns
  module Api
    module V1
      module NotificationControllerDoc
        extend ActiveSupport::Concern
        included do
          swagger_path '/api/v1/notification/send_sns' do
            operation :post do
              key :summary, 'send verification code to user'
              key :operationId, 'send sns'
              key :tags, ['Notification']
              parameter :app_token
              parameter(name: 'phone', in: :query, description: 'Phone number exp: +819000000000', required: true, type: :string)
              response 204 do
                key :description, 'success'
              end
            end
          end

        end
      end
    end
  end
end