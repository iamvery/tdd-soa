require 'animals/version'
require 'animals/fake_client'
require 'animals/real_client'

module Animals
  def self.client(host, fake: false)
    if fake
      FakeClient.new(host)
    else
      RealClient.new(host)
    end
  end
end
