require 'ostruct'

module Animals
  module Resources
    class FakeCat
      def initialize(_host)
        # noop
      end

      def list
        [
          OpenStruct.new(name: 'Garfield'),
          OpenStruct.new(name: 'Felix'),
          OpenStruct.new(name: 'Silvester'),
        ]
      end
    end
  end
end
