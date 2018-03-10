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
        parsed.fetch('data').map { |cat_data|
          OpenStruct.new(cat_data.fetch('attributes'))
        }
      end
    end
  end
end
