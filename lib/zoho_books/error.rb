# frozen_string_literal: true

class ZohoBooks::Error
  attr_reader :code, :message

  def initialize(code, message)
    @code = code
    @message = message
  end
end
