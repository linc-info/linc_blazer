class LpController < ApplicationController
  def index
    @via = params["via"].blank? ? "null" : params["via"]
    Log.create(
         userId: 1,
         module: "lp",
         action: @via,
         message: "访问活动页面",
         data: "#{request.device_type} | #{request.os} | #{request.browser}",
         ip: request.remote_ip,
         createdTime: Time.now.to_i,
         level: "info"
    )
  end

  def log
      Log.create(
           userId: 1,
           module: "lp_button",
           action: params["via"],
           message: "访问活动页面",
           data: "#{request.device_type} | #{request.os} | #{request.browser}",
           ip: request.remote_ip,
           createdTime: Time.now.to_i,
           level: "info"
      )
  end
end