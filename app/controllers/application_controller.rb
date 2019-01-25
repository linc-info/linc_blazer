class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  rescue_from Exception, with: :rescue_error

  def rescue_error(e)
    if e.respond_to?(:full_message)
      logger.error "#{controller_name}##{action_name}: #{params.inspect} #{e.full_message}"
    else
      logger.error "#{controller_name}##{action_name}: #{params.inspect} #{e.inspect} #{e.backtrace.join("\n")}"
    end

    render json: {error: "#{e.class}: #{e.message}"}, status: :internal_server_error
    # unless performed?
    #   respond_to do |type|
    #     type.json {render json: {error: "#{ex.class}: #{ex.message}"}, status: :internal_server_error}
    #     type.all {render plain: '500', status: :internal_server_error}
    #   end
    # end
  end
end
