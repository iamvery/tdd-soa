require 'spec_helper'
require 'service_providers/pact_helper'
require 'animals/resources/cat'
require 'behaviors/cat_resource'
require 'ostruct'

RSpec.describe Animals::Resources::Cat, :pact do
  describe '#list' do
    garfield = OpenStruct.new(id: '1', name: 'Garfield', age: 39)
    felix = OpenStruct.new(id: '2', name: 'Felix', age: 99)
    sylvester = OpenStruct.new(id: '3', name: 'Sylvester', age: 76)

    before do
      body = {
        data: [
          { id: Pact.like(garfield.id), type: 'cat', attributes: { name: garfield.name, age: garfield.age} },
          { id: Pact.like(felix.id), type: 'cat', attributes: { name: felix.name, age: felix.age} },
          { id: Pact.like(sylvester.id), type: 'cat', attributes: { name: sylvester.name, age: sylvester.age} },
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

  describe '#create' do
    name = 'Garfield'
    age = 39

    before do
      body = {
        data: {
          id: Pact.like('1'),
          type: 'cat',
          attributes: {
            name: name,
            age: age,
          },
        }
      }

      animals_service
        .upon_receiving('a request to create a cat')
        .with(method: :post, path: '/cats')
        .will_respond_with(status: 201, body: body)
    end

    it_behaves_like 'creating a cat', name, age
  end
end
