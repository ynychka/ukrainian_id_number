# frozen_string_literal: true

RSpec.describe UkrainianIdNumber do
  describe '#birthday' do
    it "returns birthday" do
      result = UkrainianIdNumber::Processor.new("3401600000").call

      expect(result.birthday.iso8601).to eq '1993-02-17'
    end

    it 'returns birthday 2' do
      result = UkrainianIdNumber::Processor.new('3620700000').call

      expect(result.birthday.iso8601).to eq '1999-02-17'
    end

    it 'returns birthday 3' do
      result = UkrainianIdNumber::Processor.new('3340000000').call

      expect(result.birthday.iso8601).to eq '1991-06-12'
    end
  end

  describe "#valid?" do
    it 'is truthy when 10-digit string' do
      result = UkrainianIdNumber::Processor.new('0123456789').call

      expect(result.valid?).to be_truthy
    end

    it 'is truthy when 10-digit number' do
      result = UkrainianIdNumber::Processor.new(1234567890).call

      expect(result.valid?).to be_truthy
    end

    it 'is falsey when 9-digit string' do
      result = UkrainianIdNumber::Processor.new('987654321').call

      expect(result.valid?).to be_falsey
    end

    it 'is falsey when nil' do
      result = UkrainianIdNumber::Processor.new(nil).call

      expect(result.valid?).to be_falsey
    end

    it 'is falsey when empty string' do
      result = UkrainianIdNumber::Processor.new("").call

      expect(result.valid?).to be_falsey
    end

    it 'is falsey when object' do
      result = UkrainianIdNumber::Processor.new(Array.new(10, 1)).call

      expect(result.valid?).to be_falsey
    end
  end
end
