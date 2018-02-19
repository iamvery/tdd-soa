require 'support/service_config'

RSpec.shared_examples 'listing cats' do |cats|
  include ServiceConfig

  subject(:resource) { described_class.new(animals_uri) }

  it 'returns all known cats' do
    known_cats = resource.list
    expect(known_cats).to match_array(cats)
  end
end
