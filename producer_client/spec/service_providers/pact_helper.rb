require 'pact/consumer/rspec'
require 'support/service_config'

Pact.service_consumer 'Animals Client' do
  include ServiceConfig

  has_pact_with 'Animals Service' do
    mock_service :animals_service do
      port ANIMALS_PORT
    end
  end
end
