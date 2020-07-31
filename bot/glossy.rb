module Glossy
  class Slackbot
    def initialize(bot)
      @config = bot.config
      @config.extend Config

      @bot = bot
      @bot.on_command "help", &(method :help)
    end

    def help(message)
      message.reply "Glossy, at your service."
    end

    def send_message(user, message)
      return unless user

      im = @bot.web_client.im_open user: user.slack_id
      @bot.web_client.chat_postMessage channel: im.channel.id, text: message, as_user: true
    end
  end
end
