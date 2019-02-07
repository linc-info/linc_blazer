# just a sample for user controller api, you can modify it as you want.
# rubocop:disable Metrics/ModuleLength, Metrics/BlockLength
module Concerns
  module Api
    module V1
      module FindControllerDoc
        extend ActiveSupport::Concern
        included do
          swagger_path '/api/v1/find' do
            operation :get do
              key :summary, 'get find index'
              key :operationId, 'index'
              key :tags, ['Find']
              parameter :app_token
              parameter(name: 'page', in: :query, description: 'page number of find', required: true, type: :integer, default: 0)
              parameter(name: 'type', in: :query, description: 'type of find content', required: false, type: :string)
              response 200 do
                key :description, 'success'
              end
            end
          end

        end
      end
    end
  end
end

