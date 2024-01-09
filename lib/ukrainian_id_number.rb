# frozen_string_literal: true

require_relative "ukrainian_id_number/version"
require 'date'

module UkrainianIdNumber
  class Error < StandardError; end

  class Processor
    attr_reader :id_number, :start_date, :birthday
    def initialize(id_number)
      @id_number = id_number
      @start_date = Date.parse('1 Jan 1900')
    end

    def call
      @birthday = (start_date + birthday_token.to_i) - 1

      self
    end

    private

    def birthday_token
      @id_number[0..4]
    end
  end
end
