require 'spec_helper'
require 'animals'

RSpec.describe Animals do
  describe '.client' do
    it 'returns a real client' do
      body = {
        data: [
          { id: '1', attributes: { name: 'real' } },
          { id: '2', attributes: { name: 'cats' } },
        ]
      }
      stub_request(:get, 'http://animals/cats').to_return(body: body.to_json)
      client = described_class.client('http://animals')

      cats = client.cats.list

      expect(cats.map(&:name)).to match_array(['real', 'cats'])
    end

    it 'returns a fake client' do
      client = described_class.client('http://animals', fake: true)
      client.cats.create(name: 'Garfield')
      client.cats.create(name: 'Felix')
      client.cats.create(name: 'Sylvester')
      cats = client.cats.list
      expect(cats.map(&:name)).to match_array(['Garfield', 'Felix', 'Sylvester'])
    end
  end
end
