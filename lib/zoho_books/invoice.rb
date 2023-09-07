# frozen_string_literal: true

class ZohoBooks::Invoice
  BASE_URL = 'https://books.zoho.eu/api/v3/invoices'


  class << self
    @id = id
  end

  def self.list(access_token:,  **args)
    response = HTTParty.get("#{BASE_URL}?#{query(args)}",headers: {
      'Authorization' => "Zoho-oauthtoken #{access_token}"
    })

    response.parsed_response['invoices'].presence || raise(Zoho::GetInvoicesError)
  end

  private

  def query(query_params)
    if query_params.present?
      query_from_given_block = query_params.map { |k, v| "#{k}=#{v}" }.join('&')
      "organization_id=#{ENV['ZOHO_ORGANISATION_ID']}&#{query_from_given_block}"
    else
      "organization_id=#{ENV['ZOHO_ORGANISATION_ID']}"
    end
  end
end
