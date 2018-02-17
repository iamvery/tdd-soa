require 'net/http'
require 'uri'
require 'ostruct'

module Animals
  module Resources
    class Cat
      def list
        uri = URI('http://localhost:1234/cats')
        response = Net::HTTP.get(uri)
        parsed = JSON.parse(response)
        parsed.fetch('cats').map(&OpenStruct.method(:new))
      end
    end
  end
end
