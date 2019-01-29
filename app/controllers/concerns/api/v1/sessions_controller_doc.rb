module Concerns
  module Api
    module V1
      module SessionsControllerDoc
        extend ActiveSupport::Concern
        included do
          swagger_path '/api/v1/sessions' do
            operation :post do
              key :summary, 'let user sign in'
              key :operationId, 'sign in'
              key :tags, ['Session']
              parameter :app_token
              parameter(name: 'phone', in: :query, description: 'Phone number exp: +819000000000', required: true, type: :string)
              parameter(name: 'password', in: :query, description: 'Password of user', required: true, type: :string)
              response 200 do
                key :description, 'success'
              end
            end
          end

          swagger_path '/api/v1/sessions/destroy' do
            operation :post do
              key :summary, 'let user sign out'
              key :operationId, 'sign out'
              key :tags, ['Session']
              parameter :app_token
              parameter :authorization
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