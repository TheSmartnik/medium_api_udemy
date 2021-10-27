require "medium_api/version"
require 'httparty'
require 'medium_api/utils'
require 'medium_api/resource_api'
require 'medium_api/errors'
require 'medium_api/client'
require 'medium_api/configuration'
require 'medium_api/user'
require 'medium_api/publication'
require 'medium_api/post'
require 'medium_api/contributor'

module MediumApi
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def me
      attributes = client.me

      User.new(**Utils.underscore_keys(attributes))
    end

    def client
      @client ||= Client.new(api_key: configuration.api_key)
    end
  end
end
