# just a sample for user controller api, you can modify it as you want.
# rubocop:disable Metrics/ModuleLength, Metrics/BlockLength
module Concerns
  module Api
    module V1
      module UsersControllerDoc
        extend ActiveSupport::Concern
        included do
          swagger_path '/api/v1/users' do
            operation :post do
              key :summary, 'create a user'
              key :operationId, 'sign up'
              key :tags, ['User']
              parameter :app_token
              parameter(name: 'phone', in: :query, description: 'Phone number exp: +819000000000', required: true, type: :string)
              parameter(name: 'nickname', in: :query, description: 'name of user', required: true, type: :string)
              parameter(name: 'password', in: :query, description: 'password of user', required: true, type: :string)
              response 200 do
                key :description, 'success'
              end
            end
          end

          swagger_path '/api/v1/users/check' do
            operation :post do
              key :summary, 'check user info'
              key :operationId, 'check user info'
              key :tags, ['User']
              parameter :app_token
              parameter(name: 'phone', in: :query, description: 'Phone number exp: +819000000000', required: true, type: :string)
              parameter(name: 'nickname', in: :query, description: 'name of user', required: true, type: :string)
              parameter(name: 'password', in: :query, description: 'password of user', required: true, type: :string)
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

