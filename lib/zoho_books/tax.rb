# frozen_string_literal: true
require 'httparty'

module ZohoBooks
  class Tax
    def self.list(opts = {})
      query = opts.map { |k, v| "#{k}=#{v}" }.join('&')
      ZohoBooks::Connection.get("#{BASE_URL}/settings/taxes?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
    end

    def self.get(id, opts = {})
      ZohoBooks::Connection.get("#{BASE_URL}/settings/taxes/#{id}?organization_id=#{ZohoBooks.config.organization_id}")
    end

    def self.create(body, opts = {})
      ZohoBooks::Connection.post("#{BASE_URL}/settings/taxes?organization_id=#{ZohoBooks.config.organization_id}", body.to_json)
    end

    def self.update(id, body, opts = {})
      ZohoBooks::Connection.put("#{BASE_URL}/settings/taxes/#{id}?organization_id=#{ZohoBooks.config.organization_id}", body.to_json)
    end

    def self.delete(id, opts = {})
      ZohoBooks::Connection.delete("#{BASE_URL}/settings/taxes/#{id}?organization_id=#{ZohoBooks.config.organization_id}")
    end
  end
end
