require 'net/http'
require 'uri'
require 'ostruct'

module Animals
  module Resources
    class Cat
      attr_reader :host

      def initialize(host)
        @host = host
      end

      def list
        uri = URI("#{host}/cats")
        response = Net::HTTP.get(uri)
        parsed = JSON.parse(response)
        parsed.fetch('cats').map(&OpenStruct.method(:new))
      end
    end
  end
end
