# frozen_string_literal: true

require 'httparty'

module ZohoBooks
  BASE_URL = 'https://www.zohoapis.eu/books/v3'

  class Connection
    def self.get(url)
      response = HTTParty.get(url, headers:)

      return ZohoBooks::Error.new(response.code, response['error']) if response.code != 200

      response
    end

    def self.post(url, body)
      response = HTTParty.post(url, body:, headers:)

      return render_error(response) if response.code != 201

      response
    end

    def self.put(url, body)
      response = HTTParty.put(url, body:, headers:)

      return render_error(response) if response.code != 200

      response
    end

    def self.delete(url)
      response = HTTParty.delete(url, headers:)

      return render_error(response) if response.code != 200

      response
    end

    def self.headers
      {
        'Authorization' => "Zoho-oauthtoken #{access_token}",
        'Content-Type' => 'application/json'
      }
    end

    def self.access_token
      if ZohoBooks.config.access_token_expires_at.nil? || ZohoBooks.config.access_token_expires_at < Time.now.to_i
        ZohoBooks::Auth.refresh_access_token
      else
        ZohoBooks.config.access_token
      end
    end

    def self.render_error(response)
      ZohoBooks::Error.new(response.code, response['message'] || '')
    end
  end
end
