require 'pact/consumer/rspec'

Pact.service_consumer 'Animals Client' do
  has_pact_with 'Animals Service' do
    mock_service :animals_service do
      port 1234
    end
  end
end
