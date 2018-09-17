require 'rspec'
require 'nokogumbo'

host = ENV["TARGET_HOST"] ||= "localhost"
port = ENV["TARGET_PORT"] ||= "4567"
expected_text = ENV["EXPECTED_TEXT"] ||= "Hello"

home_page_url = "http://#{host}:#{port}/"


RSpec.describe 'Home page' do

  it 'should displays hello' do
    expect(Nokogiri::HTML5.get(home_page_url).search('body').text).to include(expected_text)
  end
end