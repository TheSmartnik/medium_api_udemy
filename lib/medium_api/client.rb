module MediumApi
  class Client
    include HTTParty

    base_uri 'https://api.medium.com/v1'

    attr_reader :api_key

    def initialize(api_key:)
      @api_key = api_key

      self.class.headers("Authorization" => "Bearer #{api_key}")
    end

    def me
      self.class.get('/me')['data']
    end
  end
end
