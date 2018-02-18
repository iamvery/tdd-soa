require 'support/service_config'

RSpec.shared_examples 'listing cats' do |names|
  include ServiceConfig

  subject(:resource) { described_class.new(animals_uri) }

  it 'returns all known cats' do
    cats = resource.list
    expect(cats.map(&:name)).to match_array(names)
  end
end
