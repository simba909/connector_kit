require 'httparty'

require 'connector_kit/token_generator'
require 'connector_kit/exceptions'
require 'connector_kit/version'
require 'connector_kit/mappers/app_list_mapper'
require 'connector_kit/mappers/build_list_mapper'
require 'connector_kit/mappers/build_details_mapper'

module ConnectorKit
  # Client class used for communicating with the App Store Connect API
  class Client
    include HTTParty
    base_uri 'https://api.appstoreconnect.apple.com/v1'

    def initialize(issuer_id, key_id, private_key_file_path)
      token_generator = TokenGenerator.new(
        issuer_id,
        key_id,
        private_key_file_path
      )

      self.class.headers(
        'Authorization' => "Bearer #{token_generator.generate_token}"
      )
    end

    def apps
      get '/apps', AppListMapper.new
    end

    def app_builds(app)
      get "/apps/#{app.id}/builds", BuildListMapper.new
    end

    def build_beta_details(build)
      get "/buildBetaDetails/#{build.id}", BuildDetailsMapper.new
    end

    private

    def get(url, mapper)
      response = self.class.get(url)

      raise make_api_error(response) unless response.code == 200

      mapper.map(response.parsed_response['data'])
    end

    def make_api_error(response)
      # For the time being, the first error received is enough
      error = response.parsed_response['errors'].first
      APIError.new(error['title'], error['detail'], error['status'])
    end
  end
end
