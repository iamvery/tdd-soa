require 'animals/client'
require 'animals/resources/fake_cat'

module Animals
  class FakeClient < Client
    def initialize(host)
      super(
        host,
        cat_resource: Resources::FakeCat,
      )
    end
  end
end
