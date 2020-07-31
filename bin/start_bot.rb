#!/usr/bin/env ruby 
require_relative "../bot/glossy2.rb"
require "slacky"
require "slack-ruby-client"

#require "bundler/setup" # Set up gems listed in the Gemfile.
#require_relative "../config/application"

Slack.configure do |config|
    config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::RealTime::Client.new

client.on :hello do
    puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
    case data.text
    when /^hello/ then
        client.message(channel: data.channel, text: "Sorry <@#{data.user}>, what?")
    when /^yo/ then
      client.message(channel: data.channel, text: "back at ya")
    when "count" then
        client.message(channel: data.channel, text: Thing.count)
    end
end

client.on :close do |_data|
    puts "Client is about to disconnect"
end

client.on :closed do |_data|
    puts "Client has disconnected successfully!"
end

client.start!


# config = {}
# cli = Slacky::CLI.new "Glossy", Glossy::Slackbot, config
# exit cli.send(:run,[]) ? 0 : 1
