require 'spec_helper'
require 'animals/client'

RSpec.describe Animals::Client do
  class TestCatResource
    def initialize(_host)
      # noop
    end

    def list
      %w(test cats)
    end
  end

  subject(:client) {
    described_class.new(
      'http://animals',
      cat_resource: TestCatResource,
    )
  }

  describe '#cats' do
    it 'delegates to resource instance' do
      expect(client.cats.list).to match_array(['test', 'cats'])
    end
  end
end
