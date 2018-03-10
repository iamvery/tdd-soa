require 'ostruct'

module Animals
  module Resources
    class FakeCat
      @@cats = []

      def self.reset!
        @@cats = []
      end

      def initialize(_host)
        # noop
      end

      def list
        @@cats
      end

      def create(attributes)
        id = @@cats.length + 1
        OpenStruct.new(attributes.merge(id: id.to_s)).tap { |cat|
          @@cats << cat
        }
      end

      def delete(id)
        cat = @@cats.find { |c| c.id == id }
        @@cats.delete(cat)
        true
      end
    end
  end
end
