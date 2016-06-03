require 'yaml'
require 'net/http'
require 'net/https'
require 'open-uri'
require 'json'


def test
  response = YAML.load(File.open("yaml.yml"))
  puts "²éÑ¯×Ö·û´®#{"a"}"
  response.each do |k,v|
    ss = Thread.new{
      url_response = Net::HTTP.get(URI.parse(v))
      File.new('input.json', "w+").syswrite(url_response)
      js_response = JSON.parse(File.read('input.json'))
      # puts js_response.class
      js_response.each do |a,b|
        if b.to_s["a"]
          puts "Key: #{a}"
        end
      end
    }
    ss.join
  end
end
test