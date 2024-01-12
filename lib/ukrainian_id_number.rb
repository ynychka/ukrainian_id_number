# frozen_string_literal: true

require_relative "ukrainian_id_number/version"
require 'date'

module UkrainianIdNumber
  class Error < StandardError; end

  class Processor
    attr_reader :id_number, :start_date, :birthday

    CORRECTION = 1
    def initialize(id_number)
      @id_number = id_number.to_s
    end

    def call
      @birthday = process_birthday

      self
    end

    def valid?
      return false unless (id_number && !id_number.empty?)

      !!(id_number =~ /^\d{10}$/)
    end

    private

    def start_date
      @start_date ||= Date.parse('1 Jan 1900')
    end

    def process_birthday
      (start_date + birthday_token.to_i) - CORRECTION
    end

    def birthday_token
      @id_number[0..4]
    end
  end
end
