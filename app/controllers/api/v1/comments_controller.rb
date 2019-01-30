module Api
  module V1
    class CommentsController < ApiController
      # include Concerns::Api::V1::CommentsControllerDoc

      #skip_before_action :doorkeeper_authorize!
      # before_action :set_prefectures, only: [:index, :show]

      def index
        #authorize Course
        @comments = Comment.select(select_columns).first 10
        render json: @comments, status: 200
      end

      def show
        @comments = Comment.select(select_columns).find(params[:id])
        #authorize @comments
        render json: @comments, status: 200
      end

      private
        def per
          50
        end

        def select_columns
          [ :id, :content ]
        end
    end
  end
end
