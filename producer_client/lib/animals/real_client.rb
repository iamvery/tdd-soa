require 'animals/client'
require 'animals/resources/cat'

module Animals
  class RealClient < Client
    def initialize(host)
      super(
        host,
        cat_resource: Resources::Cat,
      )
    end
  end
end
