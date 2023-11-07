# frozen_string_literal: true

require 'httparty'

module ZohoBooks
  class Payment
    def self.create(body, _opts = {})
      ZohoBooks::Connection.post("#{BASE_URL}/customerpayments?organization_id=#{ZohoBooks.config.organization_id}", body.to_json)
    end
  end
end
