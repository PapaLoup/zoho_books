# frozen_string_literal: true

module ZohoBooks
  module Invoices
    class Status
      def self.update(id)
        ZohoBooks::Connection.post("#{BASE_URL}/invoices/#{id}/status/sent?organization_id=#{ZohoBooks.config.organization_id}", {}.to_json)
      end
    end
  end
end
