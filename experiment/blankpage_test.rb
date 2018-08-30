require 'mechanize'


if $0 == "#{__FILE__ }"

  ENV["TARGET_HOST"] ||= "localhost"
  ENV["TARGET_PORT"] ||= "8080"
  ENV["BODY_TEXT"] ||= "Hello"

  a = Mechanize.new do |agent|
    agent.user_agent_alias = 'Mac Safari'
  end

  url = "http://#{ENV['TARGET_HOST']}:#{ENV["TARGET_PORT"]}"

  a.get(url) do |page|
    page_body = page.body
    if page_body ENV["BODY_TEXT"]
    end

  end
end
