animals_uri = ENV.fetch('ANIMALS_URI')
ANIMALS = Animals.client(animals_uri, fake: Rails.env.test?)
