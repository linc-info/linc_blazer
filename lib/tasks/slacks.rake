namespace :slacks do
  desc 'send sign up message'
  task send_sign_up_message: :environment do
    yml = YAML.load_file(ENV['SLACK_YML_PATH'])
    if yml
      users = User.where("id > ?", yml['user_id']).order(:id)
      users.each {|u| SendSignUpMessageWorker.perform_async(u.id)}
      yml['user_id'] = users.last.id if users.last.present?
      File.open(ENV['SLACK_YML_PATH'], 'w') {|f| YAML.dump(yml, f)}
    else
      File.open(ENV['SLACK_YML_PATH'], 'w') {|f| f.write  ({'user_id' => User.last.id}).to_yaml }
    end
  end
end