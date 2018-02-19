require 'rails_helper'

RSpec.describe 'Cats', type: :request do
  describe 'GET /cats' do
    it 'responds successfully with a list of cats' do
      garfield = Cat.create!(name: 'Garfield', age: 39)
      felix = Cat.create!(name: 'Felix', age: 99)
      sylvester = Cat.create!(name: 'Sylvester', age: 76)

      get '/cats'

      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      cats = json.fetch('cats')
      expect(cats).to match_array([
        hash_including('name' => garfield.name, 'age' => garfield.age),
        hash_including('name' => felix.name, 'age' => felix.age),
        hash_including('name' => sylvester.name, 'age' => sylvester.age),
      ])
    end
  end
end
