# frozen_string_literal: true

require_relative '../day24/day24'

RSpec.describe Day24BlizzardBasin do
  let(:input_lines) do
    data = <<~INPUT_DATA
      #.#####
      #.....#
      #>....#
      #.....#
      #...v.#
      #.....#
      #####.#
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(10)
  end

  it 'part 2' do
    expect(subject.part2).to eq(30)
  end
end
