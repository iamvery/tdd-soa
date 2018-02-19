require 'pact/provider/rspec'

Pact.provider_states_for 'Animals Client' do
  provider_state 'some cats exist' do
    set_up do
      Cat.create!(name: 'Garfield')
      Cat.create!(name: 'Felix')
      Cat.create!(name: 'Sylvester')
    end

    tear_down do
      Cat.destroy_all
    end
  end
end

Pact.service_provider 'Animals Service' do
  honours_pact_with 'Animals Client' do
    pact_uri '../producer_client/spec/pacts/animals_client-animals_service.json'
  end
end
