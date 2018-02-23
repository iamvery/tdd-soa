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
        parsed.fetch('data').map(&method(:deserialize))
      end

      private

      # TODO this logic should probably be extracted to a value object
      def deserialize(data)
        id = data.fetch('id')
        attributes = data.fetch('attributes')
        OpenStruct.new(attributes.merge(id: id))
      end
    end
  end
end
