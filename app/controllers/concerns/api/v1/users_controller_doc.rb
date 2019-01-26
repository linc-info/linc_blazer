# just a sample for user controller api, you can modify it as you want.
# rubocop:disable Metrics/ModuleLength, Metrics/BlockLength
module Concerns
  module Api
    module V1
      module UsersControllerDoc
        extend ActiveSupport::Concern
        included do
          swagger_schema :Accesstoken do
            key :required, [:accesstoken]
            property :data do
              key :type, :object
              property :type do
                key :type, :string
              end
              property :id do
                key :type, :string
              end
              property :attributes do
                key :type, :object
                property :email do
                  key :type, :string
                end
                property :token_object do
                  key :type, :object
                  property :access_token do
                    key :type, :string
                  end
                  property :token_type do
                    key :type, :string
                  end
                  property :expires_in do
                    key :type, :string
                  end
                  property :refresh_token do
                    key :type, :string
                  end
                  property :created_at do
                    key :type, :string
                  end
                end
              end
            end
          end

          swagger_schema :User do
            key :type, :object
            property :email do
              key :name, "email"
              key :description, "Email"
              key :required, true
              key :type, :string
              key :example, "test@example.com"
            end
            property :password do
              key :name, "password"
              key :description, "Password (at least 8 characters)"
              key :required, true
              key :type, :string
              key :format, :password
              key :example, "12345678"
            end
            property :password_confirmation do
              key :name, "password_confirmation"
              key :description, "Password Confirmation (at least 8 characters)"
              key :required, true
              key :type, :string
              key :format, :password
              key :example, "12345678"
            end
            property :gender do
              key :name, "gender"
              key :description, "Gender"
              key :required, false
              key :type, :string
              key :example, "male"
            end
            property :birthday do
              key :name, "birthday"
              key :description, "Birthday"
              key :required, false
              key :type, :string
              key :example, Time.current.strftime('%F')
              key :format, :datetime
            end
            property :career do
              key :name, "career"
              key :description, "Career"
              key :required, false
              key :type, :string
              key :example, 'student'
            end
            property :signed_up_from do
              key :name, "signed_up_from"
              key :description, "[client platform]
              0: unknown
              1: iOS
              2 : Android"
              key :required, false
              key :type, :number
              key :example, 1
            end
          end

          swagger_schema :login_params do
            key :type, :object
            property :username do
              key :name, "username"
              key :description, "Email"
              key :required, true
              key :type, :string
              key :example, "test@example.com"
            end
            property :password do
              key :name, "password"
              key :description, "Password (at least 8 characters)"
              key :required, true
              key :type, :string
              key :format, :password
              key :example, "12345678"
            end
            property :grant_type do
              key :name, "grant_type"
              key :description, "grant_type"
              key :required, true
              key :type, :string
              key :format, :password
              key :example, "password"
            end
          end

          swagger_path '/api/v1/users' do
            operation :post do
              key :summary, "Sign up"
              key :description, "Register a new user"
              key :tags, %w[users]
              parameter do
                key :name, :user
                key :in, :body
                key :required, true
                schema do
                  key :required, [:user]
                  property :user do
                    key :'$ref', :User
                  end
                end
              end

              response 201 do
                key :description, "Created"
                schema do
                  key :"$ref", :Accesstoken
                end
              end

              response 422 do
                key :description, "Unprocessable Entity"
              end

              response 500 do
                key :description, "Internal Server Error"
              end

              response :default do
                key :description, "Unknown Error"
              end
            end
          end

          swagger_path '/oauth/token' do
            operation :post do
              key :summary, "User Login"
              key :description, "Get Access Token"
              key :tags, %w[users]
              parameter do
                key :name, :user
                key :in, :body
                key :required, true
                schema do
                  key :required, [:user]
                  key :'$ref', :login_params
                end
              end

              response 200 do
                key :description, "200 OK"
              end

              response 401 do
                key :description, "Invalid Auth"
              end

              response 500 do
                key :description, "Internal Server Error"
              end

              response :default do
                key :description, "Unknown Error"
              end
            end
          end


        end

      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength, Metrics/BlockLength
