require 'pact/provider/rspec'

Pact.provider_states_for 'Animals Client' do
  provider_state 'some cats exist' do
    set_up do
      Cat.create!(name: 'Garfield', age: 39)
      Cat.create!(name: 'Felix', age: 99)
      Cat.create!(name: 'Sylvester', age: 76)
    end
  end

  provider_state 'a cat exists with ID 123' do
    set_up do
      Cat.create!(id: 123, name: 'Shadow', age: 7)
    end
  end
end

Pact.tear_down do
  Cat.destroy_all
end

Pact.service_provider 'Animals Service' do
  honours_pact_with 'Animals Client' do
    pact_uri '../producer_client/spec/pacts/animals_client-animals_service.json'
  end
end
