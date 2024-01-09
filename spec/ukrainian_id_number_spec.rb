# frozen_string_literal: true

RSpec.describe UkrainianIdNumber do
  it "returns birthday" do
    result = UkrainianIdNumber::Processor.new("3401610018").call

    expect(result.birthday.iso8601).to eq '1993-02-17'
  end

  it 'returns birthday 2' do
    result = UkrainianIdNumber::Processor.new('3620702591').call

    expect(result.birthday.iso8601).to eq '1999-02-17'
  end
end
