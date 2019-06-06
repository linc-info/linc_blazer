class RedirectController < ApplicationController

  def bilibili
    Log.create(
         userId: 1,
         module: "bilibili",
         action: "bilibili",
         message: "访问活动页面",
         data: "#{request.device_type} | #{request.os} | #{request.browser}",
         ip: request.remote_ip,
         createdTime: Time.now.to_i,
         level: "info"
    )
    redirect_to "https://52japan.com/register?inviteCode=4WICO"
  end


end