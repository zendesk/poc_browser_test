require 'net/http'

class HelloApiTest
  def initialize(host:"35.226.226.62",port:"8080",test_text:"Hello")
    @host = host
    @port = port
    @test_text = test_text
    @url = "http://#{@host}:#{@port}"
    @uri = URI(@url)
  end

  def run_test(uri:@uri)
    resp = Net::HTTP.get_response(uri)
    if resp.code == "200"
      if resp.body =~ /#{@test_text}/
        puts "PASS: #{@url} has the text #{@test_text}"
        puts "response is #{resp.body}"
        exit 0
      else
        puts "FAIL: #{@url} does not the text #{@test_text}"
        puts "response is #{resp.body}"
        exit 1
      end
    end
  end
end

if __FILE__ == $0
  hat = HelloApiTest.new
  hat.run_test
end
