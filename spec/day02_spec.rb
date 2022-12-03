# frozen_string_literal: true

require_relative '../day02/day02'

RSpec.describe Day02RockPaperScissors do
  let(:input_lines) do
    data = <<~INPUT_DATA
      A Y
      B X
      C Z
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(15)
  end

  it 'part 2' do
    expect(subject.part2).to eq(12)
  end
end
