# frozen_string_literal: true
require 'httparty'

module ZohoBooks
  module Estimates
    class Template
      def self.list
        ZohoBooks::Connection.get("#{BASE_URL}/estimates/templates?organization_id=#{ZohoBooks.config.organization_id}")
      end
    end
  end
end
