# frozen_string_literal: true

require 'httparty'

module ZohoBooks
  class Item
    def self.list(opts = {})
      query = opts.map { |k, v| "#{k}=#{v}" }.join('&')
      ZohoBooks::Connection.get("#{BASE_URL}/items?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
    end

    def self.get(id, _opts = {})
      ZohoBooks::Connection.get("#{BASE_URL}/items/#{id}?organization_id=#{ZohoBooks.config.organization_id}")
    end

    def self.create(body, _opts = {})
      ZohoBooks::Connection.post("#{BASE_URL}/items?organization_id=#{ZohoBooks.config.organization_id}", body.to_json)
    end

    def self.update(id, body, _opts = {})
      ZohoBooks::Connection.put("#{BASE_URL}/items/#{id}?organization_id=#{ZohoBooks.config.organization_id}",
                                body.to_json)
    end

    def self.delete(id, _opts = {})
      ZohoBooks::Connection.delete("#{BASE_URL}/items/#{id}?organization_id=#{ZohoBooks.config.organization_id}")
    end
  end
end
