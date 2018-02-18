require 'spec_helper'
require 'service_providers/pact_helper'
require 'animals/resources/cat'
require 'support/service_config'

RSpec.describe Animals::Resources::Cat, :pact do
  include ServiceConfig

  subject(:resource) { described_class.new(animals_uri) }

  describe '#list' do
    before do
      body = {
        cats: [
          { name: 'Garfield' },
          { name: 'Felix' },
          { name: 'Silvester' },
        ],
      }

      animals_service
        .given('some cats exist')
        .upon_receiving('a request for all cats')
        .with(method: :get, path: '/cats')
        .will_respond_with(status: 200, body: body)
    end

    it 'returns all known cats' do
      cats = resource.list

      expect(cats.map(&:name)).to match_array([
        'Garfield',
        'Felix',
        'Silvester',
      ])
    end
  end
end
