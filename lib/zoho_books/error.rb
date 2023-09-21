# frozen_string_literal: true

module ZohoBooks
  class Error < StandardError
    attr_reader :code, :message

    def initialize(code, message)
      @code = code
      @message = message
    end
  end
end
