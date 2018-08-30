require 'nokogumbo'

host = ENV["TARGET_HOST"] ||= "localhost"
port = ENV["TARGET_PORT"] ||= "8080"
test_text = ENV["BODY_TEXT"] ||= "Hello"

url = "http://#{host}:#{port}/"

body_text = Nokogiri::HTML5.get(url).search('body').text

if body_text == test_text
  puts "Body text #{body_text} matches"
else
  puts "No match #{body_text.inspect}"
end