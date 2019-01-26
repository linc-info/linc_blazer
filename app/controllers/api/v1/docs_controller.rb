module Api
  module V1
    class DocsController < ActionController::Base
      include Swagger::Blocks

      swagger_root do
        key :swagger, '2.0'
        info do
          key :version, '1.0.0'
          key :title, 'LINC STUDY'
          key :description, 'Linc Study API Swagger Documents'
        end
        parameter :authorization do
          key :name, :authorization
          key :description, 'oauth token'
          key :in, :header
          key :required, true
          key :type, :string
          key :default, 'bearer xxxx'
        end
        parameter :user_id do
          key :name, :user_id
          key :description, 'the user id of the user'
          key :in, :path
          key :required, true
          key :type, :number
          key :default, 443
        end
        key :host, Rails.env.development? ? 'localhost:3000' : ENV['HOST']
        key :basePath, '/'
        key :consumes, ['application/json']
        key :produces, ['application/json']
      end

      swagger_schema 'Error' do
        property :errors do
          key :type, :array
          items do
            property :status do
              key :type, :string
              key :example, '4xx'
            end
            property :title do
              key :type, :string
              key :example, 'cannot process'
            end
            property :detail do
              key :type, :string
              key :example, 'data alreday exist'
            end
          end
        end
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
        # Api::V1::UsersController,
        Api::V1::CoursesController,
        self
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
