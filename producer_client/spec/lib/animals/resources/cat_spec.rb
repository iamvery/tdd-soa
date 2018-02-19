require 'spec_helper'
require 'service_providers/pact_helper'
require 'animals/resources/cat'
require 'behaviors/cat_resource'
require 'ostruct'

RSpec.describe Animals::Resources::Cat, :pact do
  describe '#list' do
    garfield = OpenStruct.new(name: 'Garfield', age: 39)
    felix = OpenStruct.new(name: 'Felix', age: 99)
    sylvester = OpenStruct.new(name: 'Sylvester', age: 76)

    before do
      body = {
        cats: [
          garfield.to_h,
          felix.to_h,
          sylvester.to_h,
        ],
      }

      animals_service
        .given('some cats exist')
        .upon_receiving('a request for all cats')
        .with(method: :get, path: '/cats')
        .will_respond_with(status: 200, body: body)
    end

    it_behaves_like 'listing cats', [garfield, felix, sylvester]
  end
end
