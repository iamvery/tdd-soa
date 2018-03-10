require 'spec_helper'
require 'animals/resources/fake_cat'
require 'behaviors/cat_resource'

RSpec.describe Animals::Resources::FakeCat do
  describe '#list' do
    garfield = OpenStruct.new(id: '1', name: 'Garfield', age: 39)
    felix = OpenStruct.new(id: '2', name: 'Felix', age: 99)
    sylvester = OpenStruct.new(id: '3', name: 'Sylvester', age: 76)

    before do
      fake = described_class.new(nil)
      fake.create(garfield.to_h)
      fake.create(felix.to_h)
      fake.create(sylvester.to_h)
    end

    it_behaves_like 'listing cats', [garfield, felix, sylvester]
  end

  describe '#create' do
    name = 'Garfield'
    age = 39

    it_behaves_like 'creating a cat', name, age

    it 'keeps created cats in memory' do
      resource = described_class.new(nil)
      cat = resource.create(name: name, age: age)

      expect(resource.list).to match_array([cat])
    end

    it 'increments created cat IDs' do
      resource = described_class.new(nil)
      first_cat = resource.create({})
      second_cat = resource.create({})

      expect(first_cat.id).to eq('1')
      expect(second_cat.id).to eq('2')
    end
  end
end
