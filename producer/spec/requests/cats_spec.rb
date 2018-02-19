require 'rails_helper'

RSpec.describe 'Cats', type: :request do
  describe 'GET /cats' do
    it 'responds successfully with a list of cats' do
      garfield = Cat.create!(name: 'Garfield')
      felix = Cat.create!(name: 'Felix')
      sylvester = Cat.create!(name: 'Sylvester')

      get '/cats'

      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      cats = json.fetch('cats')
      expect(cats).to match_array([
        hash_including('name' => garfield.name),
        hash_including('name' => felix.name),
        hash_including('name' => sylvester.name),
      ])
    end
  end
end
