module MediumApi
  class Client
    include HTTParty

    base_uri 'https://api.medium.com/v1'

    attr_reader :api_key

    CODE_TO_ERROR = {
      400 => Error::BadRequestError,
      401 => Error::UnauthorizedError,
      403 => Error::ForbiddenError
    }

    def initialize(api_key:)
      @api_key = api_key

      self.class.headers("Authorization" => "Bearer #{api_key}")
    end

    def me
      with_error_handling do
        self.class.get('/me')
      end
    end

    def user_publications(user_id)
      with_error_handling do
        self.class.get("/users/#{user_id}/publications")
      end
    end

    def publication_contributors(publication_id)
      with_error_handling do
        self.class.get("/publications/#{publication_id}/contributors")
      end
    end

    def create_user_post(user_id, post_attributes)
      with_error_handling do
        self.class.post("/users/#{user_id}/posts", body: Utils.camelcase_keys(post_attributes))
      end
    end

    def with_error_handling
      response = yield

      return response['data'] if response.success?

      message = response['errors'].first['message']
      error_class = CODE_TO_ERROR[response.code] || MediumApi::Error
      raise error_class, message
    end
  end
end
