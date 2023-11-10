# frozen_string_literal: true

require 'httparty'

module ZohoBooks
  class CreditNote
    def self.list(opts = {})
      query = opts.map { |k, v| "#{k}=#{v}" }.join('&')
      ZohoBooks::Connection.get("#{BASE_URL}/creditnotes?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
    end

    def self.get(id, _opts = {})
      query = _opts.map { |k, v| "#{k}=#{v}" }.join('&')
      ZohoBooks::Connection.get("#{BASE_URL}/creditnotes/#{id}?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
    end

    def self.create(body, _opts = {})
      ZohoBooks::Connection.post("#{BASE_URL}/creditnotes?organization_id=#{ZohoBooks.config.organization_id}",
                                 body.to_json)
    end
  end
end
