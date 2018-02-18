module Animals
  class Client
    attr_reader :host, :cat_resource

    def initialize(host, cat_resource:)
      @host = host
      @cat_resource = cat_resource
    end

    def cats
      @cats ||= cat_resource.new(host)
    end
  end
end
