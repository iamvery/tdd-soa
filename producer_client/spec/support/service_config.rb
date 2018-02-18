module ServiceConfig
  ANIMALS_PORT = 1234

  def animals_uri
    "http://localhost:#{ANIMALS_PORT}"
  end
end
