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
        response = Net::HTTP.get(uri)
        parsed = JSON.parse(response)
        parsed.fetch('data').map(&method(:deserialize))
      end

      def create(attributes)
        body = { cat: attributes }
        headers = { 'Content-Type' => 'application/json' }
        response = Net::HTTP.post(uri, body.to_json, headers)
        parsed = JSON.parse(response.body)
        data = parsed.fetch('data')
        deserialize(data)
      end

      private

      def uri
        @uri ||= URI("#{host}/cats")
      end

      # TODO this logic should probably be extracted to a value object
      def deserialize(data)
        id = data.fetch('id')
        attributes = data.fetch('attributes')
        OpenStruct.new(attributes.merge(id: id))
      end
    end
  end
end
