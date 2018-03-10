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
      expect(json).to eq({
        'data' => [
          {
            'id' => garfield.id.to_s,
            'type' => 'cat',
            'attributes' => { 'name' => garfield.name, 'age' => garfield.age },
          },
          {
            'id' => felix.id.to_s,
            'type' => 'cat',
            'attributes' => { 'name' => felix.name, 'age' => felix.age },
          },
          {
            'id' => sylvester.id.to_s,
            'type' => 'cat',
            'attributes' => { 'name' => sylvester.name, 'age' => sylvester.age },
          },
        ],
      })
    end
  end

  describe 'POST /cats' do
    it 'responds with successfully created cat' do
      name = 'Garfield'
      age = 39
      body = { cat: { name: name, age: age } }

      post '/cats', params: body.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq(201)
      json = JSON.parse(response.body)
      data = json.fetch('data')
      attributes = data.fetch('attributes')
      expect(attributes).to eq({
        'name' => name,
        'age' => age,
      })
    end
  end
end
