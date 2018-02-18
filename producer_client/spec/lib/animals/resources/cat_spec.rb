require 'spec_helper'
require 'service_providers/pact_helper'
require 'animals/resources/cat'
require 'behaviors/cat_resource'

RSpec.describe Animals::Resources::Cat, :pact do
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

    it_behaves_like 'listing cats', %w(Garfield Felix Silvester)
  end
end
