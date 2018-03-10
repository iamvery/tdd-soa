require 'support/service_config'

RSpec.shared_examples 'listing cats' do |cats|
  include ServiceConfig

  subject(:resource) { described_class.new(animals_uri) }

  it 'returns all known cats' do
    known_cats = resource.list
    expect(known_cats).to match_array(cats)
  end
end

RSpec.shared_examples 'creating a cat' do |name, age|
  include ServiceConfig

  subject(:resource) { described_class.new(animals_uri) }

  it 'creates a new cat' do
    attributes = {
      name: name,
      age: age,
    }
    cat = resource.create(attributes)

    expect(cat.id).to match(/\A\d+\z/)
    expect(cat.name).to eq(name)
    expect(cat.age).to eq(age)
  end
end

RSpec.shared_examples 'deleting a cat' do |id|
  include ServiceConfig

  subject(:resource) { described_class.new(animals_uri) }

  it 'deletes a cat' do
    success = resource.delete(id)
    expect(success).to be(true)
  end
end
