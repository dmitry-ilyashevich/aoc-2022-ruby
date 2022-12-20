# frozen_string_literal: true

require_relative '../day20/day20'

RSpec.describe Day20GrovePositioningSystem do
  let(:input_lines) do
    data = <<~INPUT_DATA
      1
      2
      -3
      3
      -2
      0
      4
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(3)
  end

  it 'part 2' do
    expect(subject.part2).to eq(1_623_178_306)
  end
end
