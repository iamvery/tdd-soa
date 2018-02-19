require 'spec_helper'
require 'animals/resources/fake_cat'
require 'behaviors/cat_resource'

RSpec.describe Animals::Resources::FakeCat do
  describe '#list' do
    garfield = OpenStruct.new(name: 'Garfield', age: 39)
    felix = OpenStruct.new(name: 'Felix', age: 99)
    sylvester = OpenStruct.new(name: 'Sylvester', age: 76)

    it_behaves_like 'listing cats', [garfield, felix, sylvester]
  end
end
