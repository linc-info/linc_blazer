class Api::V1::ApiController < ApplicationController
  include Concerns::ErrorResponseHandling
  include Concerns::RequestCheckHandling

  skip_before_action :verify_authenticity_token

  before_action :check_app_token_header
end