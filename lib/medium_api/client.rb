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

    def user_publications(user_id)
      self.class.get("/users/#{user_id}/publications")['data']
    end

    def publication_contributors(publication_id)
      self.class.get("/publications/#{publication_id}/contributors")['data']
    end

    def create_user_post(user_id, post_attributes)
      self.class.post("/users/#{user_id}/posts", body: Utils.camelcase_keys(post_attributes))['data']
    end
  end
end
