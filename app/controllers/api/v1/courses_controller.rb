module Api
  module V1
    class CoursesController < ApiController
      include Swagger::Blocks
      include Concerns::Api::V1::CoursesControllerDoc

      #skip_before_action :doorkeeper_authorize!
      # before_action :set_prefectures, only: [:index, :show]

      def index
        #authorize Course
        @courses = Course.select(select_columns).first 10
        render json: @courses, status: 200
      end

      def show
        @courses = Course.select(select_columns).find(params[:id])
        #authorize @courses
        render json: @courses, status: 200
      end

      private
        def per
          50
        end

        def select_columns
          [ :id, :title ]
        end
    end
  end
end
