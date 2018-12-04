class SlackServices
  TOKEN = ENV['SLACK_LINC_BOT_TOKEN']
  SIGN_UP_MESSAGE_CHANNEL = ENV['SLACK_SIGN_UP_MESSAGE_CHANNEL']
  POST_MESSAGE_URL = "https://slack.com/api/chat.postMessage"

  def send_sign_up_message(user_id)
    send_message(sign_up_message(User.find(user_id)), SIGN_UP_MESSAGE_CHANNEL)
  end

  private

  def send_message(text, channel)
    body = {
      token: TOKEN,
      channel: channel,
      text: text
    }
    HTTParty.post(POST_MESSAGE_URL, body: body).body
  rescue => e
    Rails.logger.warn e.full_message
  end

  def sign_up_message(user)
    <<~TEXT
      New user is created! :full_moon_with_face:
      ```
      id: #{user.id}
      nickname: #{user.nickname}
      phone: #{user.phone}
      email: #{user.email}
      created at: #{user.created_at.to_s}
      ```
    TEXT
  end

end