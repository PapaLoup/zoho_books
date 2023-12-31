# frozen_string_literal: true

require 'httparty'

module ZohoBooks
  class Estimate
    def self.list(opts = {})
      query = opts.map { |k, v| "#{k}=#{v}" }.join('&')
      ZohoBooks::Connection.get("#{BASE_URL}/estimates?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
    end

    def self.get(id, _opts = {})
      query = _opts.map { |k, v| "#{k}=#{v}" }.join('&')
      ZohoBooks::Connection.get("#{BASE_URL}/estimates/#{id}?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
    end

    def self.create(body, _opts = {})
      ZohoBooks::Connection.post("#{BASE_URL}/estimates?organization_id=#{ZohoBooks.config.organization_id}",
                                 body.to_json)
    end

    def self.update(id, body, _opts = {})
      ZohoBooks::Connection.put("#{BASE_URL}/estimates/#{id}?organization_id=#{ZohoBooks.config.organization_id}",
                                body.to_json)
    end

    def self.delete(id, _opts = {})
      ZohoBooks::Connection.delete("#{BASE_URL}/estimates/#{id}?organization_id=#{ZohoBooks.config.organization_id}")
    end
  end
end
