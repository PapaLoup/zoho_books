# frozen_string_literal: true

module ZohoBooks
  module Invoices
    class Payment
      def self.list(id, opts = {})
        query = opts.map { |k, v| "#{k}=#{v}" }.join('&')
        ZohoBooks::Connection.get("#{BASE_URL}/invoices/#{id}/payments?organization_id=#{ZohoBooks.config.organization_id}&#{query}")
      end
    end
  end
end
