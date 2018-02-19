require 'spec_helper'
require 'animals/resources/fake_cat'
require 'behaviors/cat_resource'

RSpec.describe Animals::Resources::FakeCat do
  describe '#list' do
    garfield = OpenStruct.new(name: 'Garfield')
    felix = OpenStruct.new(name: 'Felix')
    sylvester = OpenStruct.new(name: 'Sylvester')

    it_behaves_like 'listing cats', [garfield, felix, sylvester]
  end
end
