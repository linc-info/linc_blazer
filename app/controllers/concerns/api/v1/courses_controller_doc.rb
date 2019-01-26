# rubocop:disable Metrics/ModuleLength, Metrics/BlockLength
module Concerns
  module Api
    module V1
      module CoursesControllerDoc
        extend ActiveSupport::Concern
        included do
          swagger_path '/api/v1/shops/{id}' do
            operation :get do
              key :summary, "Get shop"
              key :description, "Get a list of shops by parameters"
              key :tags, %w[shop]
              parameter :authorization
              parameter do
                key :name, :id
                key :description, 'the id of the shop'
                key :in, :path
                key :required, true
                key :type, :number
              end

              response 200 do
                key :description, 'get shops'
                schema do
                  key :"$ref", :ShopResponse
                end
              end
              response 401 do
                key :description, 'unauthorized'
                schema do
                  key :"$ref", :Error
                end
              end
              response 404 do
                key :description, 'cannot find the shop or user'
                schema do
                  key :"$ref", :Error
                end
              end
              response 500 do
                key :description, 'internal server error'
              end
              response :default do
                key :description, 'unknown error'
              end
            end
          end

          swagger_schema 'CourseAttributes' do
            property :shop_number do
              key :description, '店舗コード'
              key :type, :string
              key :example, '1234'
            end
            property :name do
              key :description, '店舗名'
              key :type, :string
              key :example, 'Shop ABC'
            end
            property :name_kana do
              key :description, '店舗名かな'
              key :type, :string
              key :example, 'Shop ABC'
            end
            property :zip_code do
              key :description, '郵便番号'
              key :type, :string
              key :example, '107-8006'
            end
            property :prefecture do
              key :description, '都道府県'
              key :type, :string
              key :example, '北海道'
            end
            property :address do
              key :description, '住所'
              key :type, :string
              key :example, '札幌市中央區南2條西4-2-11'
            end
            property :phone_number do
              key :description, '電話番号'
              key :type, :string
              key :example, '+8132345678'
            end
            property :fax_number do
              key :description, 'FAX番号'
              key :type, :string
              key :example, '+8132345679'
            end
            property :description do
              key :description, '備考'
              key :type, :string
              key :example, 'description of this shop'
            end
            property :geo_point do
              property :longitude do
                key :description, '経度'
                key :type, :number
                key :example, 142
              end
              property :latitude do
                key :description, '緯度'
                key :type, :number
                key :example, 43
              end
            end
            property :flyer_url do
              key :description, "WEBチラシURL"
              key :type, :string
              key :example, 'https://xxx'
            end
          end

          swagger_schema 'Shop' do
            property :type do
              key :type, :string
              key :example, 'shops'
            end
            property :id do
              key :type, :string
              key :example, '1'
            end
            property :attributes do
              key :'$ref', 'ShopAttributes'
            end
            property :relationships do
              property :shop_product_tags do
                property :data do
                  key :type, :array
                  items do
                    property :type do
                      key :type, :string
                      key :example, 'shop_product_tags'
                    end
                    property :id do
                      key :type, :string
                      key :example, '1'
                    end
                  end
                end
              end
              property :shop_brand_tags do
                property :data do
                  key :type, :array
                  items do
                    property :type do
                      key :type, :string
                      key :example, 'shop_brand_tags'
                    end
                    property :id do
                      key :type, :string
                      key :example, '1'
                    end
                  end
                end
              end
              property :shop_business_hours do
                property :data do
                  key :type, :array
                  items do
                    property :type do
                      key :type, :string
                      key :example, 'shop_business_hours'
                    end
                    property :id do
                      key :type, :string
                      key :example, '1'
                    end
                  end
                end
              end
            end
          end

          swagger_schema 'ShopResponse' do
            property :data do
              key :'$ref', 'Shop'
            end
            property :included do
              key :type, :array
              items do
                property :type do
                  key :description, 'the object type, eg. shop_product_tags, shop_brand_tags, shop_business_hours'
                  key :type, :string
                  key :example, 'shop_product_tags'
                end
                property :id do
                  key :type, :string
                  key :example, '1'
                end
                property :attributes do
                  key :description, 'the fields in this object'
                end
              end
            end
          end

          swagger_schema 'ShopListResponse' do
            property :data do
              key :type, :array
              items do
                key :'$ref', 'Shop'
              end
            end
            property :included do
              key :type, :array
              items do
                property :type do
                  key :description, 'the object type, eg. shop_product_tags, shop_brand_tags, shop_business_hours'
                  key :type, :string
                  key :example, 'shop_product_tags'
                end
                property :id do
                  key :type, :string
                  key :example, '1'
                end
                property :attributes do
                  key :description, 'the fields in this object'
                end
              end
            end
          end

          swagger_path '/api/v1/shops' do
            operation :get do
              key :summary, "Get shop list"
              key :description, "Get a list of shops by parameters"
              key :tags, %w[shop]
              parameter :authorization
              parameter do
                key :name, :longitude
                key :description, 'find the shop of longitude within radius'
                key :in, :query
                key :required, false
                key :type, :number
              end
              parameter do
                key :name, :latitude
                key :description, 'find the shop of latitude within radius'
                key :in, :query
                key :required, false
                key :type, :number
              end
              parameter do
                key :name, :brand
                key :description, 'find the shop by tagged brand name'
                key :in, :query
                key :required, false
                key :type, :string
              end
              parameter do
                key :name, :facility
                key :description, 'find the shop by tagged facility name (取扱設備)'
                key :in, :query
                key :required, false
                key :type, :string
              end
              parameter do
                key :name, :prefecture
                key :description, 'find the shop by prefecture'
                key :in, :query
                key :required, false
                key :type, :string
                key :default, '北海道'
              end
              parameter do
                key :name, :keyword
                key :description, 'find keyword that partially matches by name, name_kana, zip_code, phone_number and address'
                key :in, :query
                key :required, false
                key :type, :string
              end

              response 200 do
                key :description, 'get shops'
                schema do
                  key :"$ref", :ShopListResponse
                end
              end
              response 401 do
                key :description, 'unauthorized'
                schema do
                  key :"$ref", :Error
                end
              end
              response 422 do
                key :description, 'unprocessable entity'
                schema do
                  key :"$ref", :Error
                end
              end
              response 500 do
                key :description, 'internal server error'
              end
              response :default do
                key :description, 'unknown error'
              end
            end
          end
        end

      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength, Metrics/BlockLength
