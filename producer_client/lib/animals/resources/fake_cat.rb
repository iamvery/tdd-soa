require 'ostruct'

module Animals
  module Resources
    class FakeCat
      def initialize(_host)
        # noop
      end

      def list
        [
          OpenStruct.new(name: 'Garfield', age: 39),
          OpenStruct.new(name: 'Felix', age: 99),
          OpenStruct.new(name: 'Sylvester', age: 76),
        ]
      end
    end
  end
end
