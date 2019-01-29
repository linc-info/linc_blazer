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
          key :name, 'X-SESSION-ID'
          key :description, 'token of login user'
          key :in, :header
          key :required, true
          key :type, :string
        end
        parameter :app_token do
          key :name, 'X-APP-TOKEN'
          key :description, 'oauth token'
          key :in, :header
          key :required, true
          key :type, :string
          key :default, 'pk_8e579d6def059fdf7347060342a12dde205a7acdc370903596d510875f2057a2'
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
        Api::V1::SessionsController,
        Api::V1::UsersController,
        Api::V1::CoursesController,
        Api::V1::NotificationController,
        self
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
