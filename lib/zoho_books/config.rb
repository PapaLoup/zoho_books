module ZohoBooks
  class Config
    attr_accessor :client_id, :client_secret, :redirect_uri, :refresh_token, :base_url,
                  :portal_id, :access_token, :organization_id, :refresh_token, :access_token_expires_at

    DEFAULT_BASE_URL = "https://accounts.zoho.eu".freeze

    def initialize(config = {})
      @base_url = config["base_url"] || DEFAULT_BASE_URL
      @portal_id = config["portal_id"]
      @access_token = config["access_token"]
      @client_id = config["client_id"]
      @client_secret = config["client_secret"]
      @redirect_uri = config["redirect_uri"]
      @organization_id = config["organization_id"]
      @refresh_token = config["refresh_token"]

      @access_token_expires_at = nil
    end
  end

  class << self
    attr_accessor :config

    def configure
      self.config ||= Config.new
      yield(config)
    end
  end
end
