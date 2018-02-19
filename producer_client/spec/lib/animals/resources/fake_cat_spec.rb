require 'spec_helper'
require 'animals/resources/fake_cat'
require 'behaviors/cat_resource'

RSpec.describe Animals::Resources::FakeCat do
  describe '#list' do
    it_behaves_like 'listing cats', %w(Garfield Felix Sylvester)
  end
end
