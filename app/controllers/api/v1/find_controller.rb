class Api::V1::FindController < Api::V1::ApiController
  include Concerns::Api::V1::FindControllerDoc
  include Concerns::FindHandling

  def index
    render json: get_index(params['page'].to_i, params['type'])
  end

  def recommend
  end
end