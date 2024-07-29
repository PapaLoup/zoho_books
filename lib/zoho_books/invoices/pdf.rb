# frozen_string_literal: true

module ZohoBooks
  module Invoices
    class Pdf
      def self.get(invoice_ids)
        ZohoBooks::Connection.get("#{BASE_URL}/invoices/pdf?organization_id=#{ZohoBooks.config.organization_id}&invoice_ids=#{invoice_ids.join(',')}", true)
      end
    end
  end
end
