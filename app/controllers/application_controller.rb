class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  rescue_from Exception, with: :something_error

  def something_error(ex)
    if ex.respond_to?(:full_message)
      logger.error "#{controller_name}##{action_name}: #{params.inspect} #{ex.full_message}"
    else
      logger.error "#{controller_name}##{action_name}: #{params.inspect} #{ex.inspect} #{ex.backtrace.join("\n")}"
    end

    unless performed?
      respond_to do |type|
        type.json {render json: {error: "#{ex.class}: #{ex.message}"}, status: :internal_server_error}
        type.all {render plain: '500', status: :internal_server_error}
      end
    end
  end
end
