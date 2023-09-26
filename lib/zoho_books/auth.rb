# frozen_string_literal: true
require 'httparty'

module ZohoBooks
  class Auth
    def self.refresh_access_token
      endoint_url = "oauth/v2/token?refresh_token=#{ZohoBooks.config.refresh_token}&client_id=#{ZohoBooks.config.client_id}&client_secret=#{ZohoBooks.config.client_secret}&redirect_uri=#{ZohoBooks.config.redirect_uri}&grant_type=refresh_token"
      response = HTTParty.post("#{ZohoBooks.config.base_url}/#{endoint_url}")

      return ZohoBooks::Error.new(response.code, response["error"]) if response.code != 200

      ZohoBooks.config.access_token = response.parsed_response['access_token']
      ZohoBooks.config.access_token_expires_at = Time.now.to_i + response.parsed_response['expires_in'].to_i

      response.parsed_response['access_token']
    end
  end
end
