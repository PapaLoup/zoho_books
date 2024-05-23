# frozen_string_literal: true

require 'httparty'

module ZohoBooks
  class Payment
    def self.create(body, _opts = {})
      ZohoBooks::Connection.post("#{BASE_URL}/customerpayments?organization_id=#{ZohoBooks.config.organization_id}", body.to_json)
    end

    def self.update(id, body, _opts = {})
      ZohoBooks::Connection.put("#{BASE_URL}/customerpayments/#{id}?organization_id=#{ZohoBooks.config.organization_id}", body.to_json)
    end
  end
end
