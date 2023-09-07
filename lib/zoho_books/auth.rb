# frozen_string_literal: true
require 'httparty'

class ZohoBooks::Auth
  BASE_URL = 'https://accounts.zoho.eu/oauth/v2/token'

  def self.refresh_access_token
    response = HTTParty.post("#{BASE_URL}?refresh_token="\
                               "#{ENV['ZOHO_REFRESH_TOKEN']}&client_id=#{ENV['ZOHO_CLIENT_ID']}&client_secret="\
                               "#{ENV['ZOHO_CLIENT_SECRET']}&redirect_urrefresh_access_tokeni=#{ENV['ZOHO_REDIRECT_URI']}"\
                               '&grant_type=refresh_token')

    return ZohoBooks::Error.new(response.code, response["error"]) if response.code != 200

    response.parsed_response['access_token']
  end
end
