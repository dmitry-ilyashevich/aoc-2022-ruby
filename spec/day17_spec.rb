# frozen_string_literal: true

require_relative '../day17/day17'

RSpec.describe Day17PyroclasticFlow do
  let(:input_lines) do
    data = <<~INPUT_DATA
      >>><<<>><<<>>><<<>>><<<>><<><>>><<>>><>><<<>>><<><>>><<<<>>>><>><<>>>><>>>><<<<>>>><<<>>><>><<>><<<>><<<<><<>><<><<<>><<>>><<<>>>><>>><>><><<<<><>><><<>>>><<><<<<><<<><<>>>><<><<>><<<<>>>><>>>><>><><<<>>>><>>>><>><<>>>><>>>><<><<<<>><<>>>><>>><>><>><<>><<<<>>>><<<>><<<><><<<<>><<><<<<><<<><<<<>>>><<><<<>>><<>><>><<><<<<>>>><<<>>>><<<<>><<<<>><<>>>><<><>><>>>><<<<>>>><<>>><<<><<<<>>><>><<<>>><<<>>>><<<>>>><>>>><>>><<<<>>>><<<>>><<<<>>><><<>>><<<>>>><<<>>>><>>>><<<<>><<>>><<<<><>>>><><<<<>>><<<<>>>><<<>>>><<>>><>><<>><<>><<>>><<>>>><>>><<<><<<>><<<<>>><<<>>><<<><>>><<<<><>><<<>>>><><<<<><<>><<<<>><<<>>><>><<><><<<>><<<>>><<>>>><<>><><<>>>><<<<>>><<<>><<<<>><<><<<>>>><>>><>><<<>>>><<<>>><>><<<<><><<>><<<>><<<<>>>><<<<>>><<<<>><>>>><>>><>>><<>>><<<<>><<><<<<>>>><<<<>>>><<<><<>><><<<>>><>><<>><<<>>><>>><<<<>><>><><<><>><>>><>>>><<<>>><<<<>>>><<<>>>><<<>><<<<>>>><<<>>><><<>>><>>><<<>>><<<<><>>>><<<><>>>><>>><<>>><>><<<<>>><<>><<<<>><<>>>><<<><<><><<<>><<<<>>><<<><<<<>>>><<<<>>>><<<<>><<>>><<<><<<<><<<>>><><<<<><>><<><<<<>>><<>><>><<<><<<>>><<>><<<<><<<>><<<<>>><<>>><<<>>>><<<>><<<>>>><><<>><>>><<<>><><>><<>>><<<<>>><<>>>><>><<><<<>>>><<<>>><<>><<<<>>><<<<><<<<><<>>>><>><><<<>>>><<<<>><<<<>><>><<>><<<>><><<<<>>>><<<<>>>><<<>>>><>><<>><<<><<<<>><<<<><<<><<<>>><<<>><>>><<>><<><<>><<>><<><<<><<<<>>>><<<><>>>><<>><<>>><>>><<>>><><<>>><<<>>>><<<<>>>><><<<>>><<>>>><<<<><>>><>><<>><<<><><>>><<<>>>><>>><<><>>><<>>><<<>>><<<><<<>>><<<<><<<<>>>><<<>>>><<<<>>>><<<>>><<>><<>>><<<<>><><<<><<><<<>>>><<<<>>><>><<<<><<<>>>><<<<>>>><<<>><>>>><<<><<<<>>>><>>>><<>>>><<<><<<<><<>><>>>><<<>>>><<<<>>><>>>><<<><<>>><<>><<<>><>><<<>>><<>>>><<>>><<>>>><<><<>>>><<<<>>><<<<>>><<<>>><>><<><<<<>>>><<<>>><><<<<>>><<>>><<>><<<>><<<<><><<<<>>>><<<><<>>>><<<>>>><>><<<>>>><>>>><><<<<>><<<>>><>>><>>><<<>><<<<><>>><<>>><<<>>>><>>>><><<<<>>>><<>>><>>><<<<><<>>><<<><<<>>>><<<<><><<<<><<<<>><<<><>><<<<>>><>><<><<>>><<<>>><<<<>><<<>>><<<>>>><<<<>>><>><>><<<<>>>><>>><<<<>>><<>>><>><<<><>>>><<<<><<<>><><<<<>><<<<>>>><>><>><>>>><<<>>>><<>>>><<<>>><<<<>>>><<<<>>>><<><><<<>>><<>>><<<<>>>><<<<><<>>>><<<><<<<>>>><<>><<<>><<><>><<<<>>><<<<>>><<<<>>><<>>>><<<<>><<>>><<>>><>>>><<<>>>><<>>><<<<><<<>>><<<<><<><<>>><<>>>><<<<>>><<>>><<<<>>>><<<<>>><<<<><>><<<>>>><<<<>><<<>>><<<><<>>>><>>><<>>><>>>><<<><<<<><<<><<<>>>><<>>>><>>><>>>><<>>>><<<<>>>><>><<<<><<<>>>><><<>>>><<><<<>><<<<>>>><<<<><<<><<<<>>>><>><><<<<>><<<<>>><<>><<>>><>>><<<>>>><<<<>>><<<<>>><<>>>><<>><>><<<<>>>><<<>><<>><><><<>><<<<>>><<><<<<><><<<>>>><<<<>>><<<<>>>><<<>>><<<<><<<<>>><<><<><<>>><<<><<>><>>>><<<>><<>>><<<<>>>><>>>><<<>>>><<<<>><<><<<>>>><<<>>><>>>><<<<>>>><<<<><<>>><<<<>>>><<>>>><<<<><<<<>>><<>>><><<<<><<>>><>>>><<><<<>>>><>>><<<>><<<>><<<<>><>>>><<<>><<<<><>>>><<<>><<<<>>>><<<<>><<<<>><<>>><>>>><<>>><<<<><<>><>><<<<>>>><<<<>>>><<>><<<<><<<<><<>><><<>>>><<<<>>><<<<>><<<<>><<<<>><<<<>>><<<<>>><<<<><<<>>><><>>>><<>><>>><<>>><<<>>><<><>>>><<<<>>><<<>><<<<>>><<<>>><<>><<>><><<>><<>><<>>>><>>><<<>>>><<<<>>>><<<>><>>>><<<>>><<<><<>>>><<<>><<<<>><<<>>><<<<>><<><<<>>>><<>><>>>><<<<><>>>><<><<<<>><<>>><<>><<<<>>>><<>>><<>><<>>><>>>><<<>><<<><>><<<<>>><<<>>><<><<>>>><<<><>>>><>><<<>><><<<<>><<<<>>>><<<<>><><<<>>>><><<<<>>>><<>>><>>>><<>><>><<<><>><<<>>>><>><<<><<><><<<>>><<>><<<<>><<<>>><<>><<><>><<<<>>>><<<<>><<>>>><<<>><<><>>>><<<<>>>><>>><<>>><><<<<>><<>><>>>><<<<>>>><><<>>>><>>>><<<<>>>><<<<><>><><<<>>>><>>><<><><<<><<<<>>>><<<<>><<<>>>><<<<>>>><<<<>><<>>>><>><>>>><<<<><<>><<<><<<>>>><<<>>><<>>>><>><<<<>><<<>>>><<>>>><<<<>>>><<<<><<<>><>><><><<<><<<><<<><<<<>>><<>>><<>>><<<>><<<><<<<><<>>>><>><>><<<>>><<<<>>>><<<<>>><<<<>>><<<>>>><<>><<>><>><<>>><<>>>><<<<>>>><>>>><><><<<<><<<<>><<<><<<>>><<>>><<<>>>><<>>>><<>>><<<<>>>><<<><<<<>>><<<<><<>>>><<<<>>><>><><<>>><>>>><>>><<<>><<<<>><<<>>>><<>><<<>>>><<<><<<<>>><<<<><<<><<<>><<<>>>><<>>><>><<<<>>><<<>><>>>><<><><<<><><<<>>>><<<>><<><<<>>>><<<>>>><>>>><<<>>><<<>>><<<<>><<>><>><<>><>>><<><>><>>>><<<><<<><<<><<<<>><<>>>><>>>><>>><<<<><<<<>>>><<><<<>>><<<>>>><<<>>><<>>>><<>><><<<>><<<<>>>><<<<><<>><>><<<>><><<>><<<<>>><>>>><<<>><<<>><<<>>><<><<<><>><><><<>><<<>>><<<><<<><>>>><>>>><>>><<<<>>>><><<<<>>><<>><<<<>><<>>><>>>><<>>><>>>><<<>>>><<<>>>><<<<>>><<<<>><<<>>><<<>><<<>>><<<<>>><<>>>><<>>>><<<<>>>><<<<>><<<>>><<<<>>><>>>><<<<><<<<>><<<<>>>><>>><<<>><<>>>><<><<>><<<>>><<<<><<<<>>>><<<<><<<>>>><<<<>>><><<<<><<<<>><><<<>>>><>><<<<>><><>><<<>>>><><<>>>><><<<>>>><>>><<<<>>>><<<<>>><<<<>><<>>>><>>>><>>><<<><<>>>><<<<><<<<>><><>><<<>><<><<<<>>><<<<>>>><<<>><>><<>>><<<>>><<<<>>><<<><>>><<<>>><<<>><<<>>>><<<>><<>>>><<<<>>><<<<>><<<><>><<<>><><<<>><<<<><><>><<<><>><><<<>>><>>>><>>>><<<>><<<>>>><<<>>><<<<>>><<<>>>><<>>>><>><<><<<>><<>>>><>>>><<>><<<<><<<>><<>><<<><<>>>><<<<><<<>>>><<><<>>>><<><>>><><<>>><<<><<><<<<>>><<>>><>>>><><>>><<<<>><<>><<>>>><<<<>>><<<>>><<><<<><<<<>>><<>>><>><>>>><<><<<>>><<<<>>>><<>><<<<>><>>><<<>>><<>>>><<<>><<><<<>>><><<>>><<><<>>><>>>><<<<>>>><<<<>>>><<<>>>><<<<>>>><><<<<>>><>>><<<<>>><<>><<<>>>><>>>><><<<>><<>><<<>>><<<<>>><<<>>>><><<<<>>>><<><<>>><<<<>>>><<>>><<<<><>>><<<>>><<><<><<<>><>>>><<<>>>><<<>><<<>><<>>><<>>>><<<><>>>><<<<>>><<<<>><<>><<<>>><<<<>><<<<>>>><<>><<>><<<<>>>><>>>><<<>><>>><><>>><>>>><<<>>>><<>><<<>><<>><>>>><<<>>>><<<<><>>><<><<><>>>><<>>>><>>><<<<>>>><>>>><<<><<<><>>><<<>>><>>><<<>><<<<>>><>>>><<><<<<><<<>>>><<<<><<<<>><<>>><<<<><<<<>>><<>>><<<>>>><<>>>><<<>>>><<>><<>>><<<>>><<>>><>>><<>><<>><<<<><<>>>><<<>>>><<<>><<<<>>>><<>>>><>>>><>><>>>><><<<>>>><<<>>><><<<<>>><<<>><<<>><<<<>><<<>>>><<<<>>>><>>>><>><<<><><>>><>>>><<<<>>>><<<>>>><<>><>>>><<<<><<<>>>><>><<<>><<<<>>>><>>><<<<>>><<<<>><<<>>><<<<>>>><<>>><<>><<<>>><>><<>>>><<<<>>><<<<>>><<<<><<<<>>>><<<<><<<<>><>>><><<<>>><<<<>><<<<>>>><<<>>><>>><>>><<<>>><>>>><>><<>><<<<><<><>>>><<<<>>>><<<<>>>><<<>>>><><<<<>>>><<>>><<<>>>><<>>>><<<>>>><<<>><<<>><<>><<>>>><>>><>>>><<<<>>><<<>><<>>>><>>>><<<><<><<<>><<<<>>>><<<><<<<>><<><<<>><<<<><>><<<<><<>>>><>>>><<><<<<>><<>><<<>>>><<>>>><<<<>>><<><<<>>>><<<<>>>><<<>>><>>>><<>>><<<<>>><<<<>>><<<<>>>><<>>>><<>>>><<<<>>>><<>>>><<>>><>><<<<>>><>>>><>><<>>><<<<>><<<>><<><<>>>><<<>><<>><>><<<>>>><<><<><<><<><<>>>><<<>><<>>>><>>><<<<><<><>>><<<><<<<>>>><<<>>><<<<>><>>>><>><<<>>><<<>>><<>><<<><<<<>>>><<<><<><<<>>><<<<>><>>><>>><<<<>>><><<<<>><<>>>><>><<>>><<><<>>><<<<>>>><>><<<><<<>>>><<<>>>><<<>><<<>>>><<><<<<><<<<>><<>>>><>>><>>><<<<>><>><>><<<>>><<>><><>>><<<<><<<<>>>><>>><<<><<><>>><<<<>>>><><>><<<><<<>>><>>><<>><<>>>><><>><>><<<>><<>>>><<<>><<<<>>>><<<>><<>>><<<<>>>><<<<><<<>><<<><>>>><<<<>>>><<<>><<<><<<>><>>>><>>><<><>><<>>>><<<<><><<>>><<<<>>><<<<>>><<>>><<>><<<<>>>><<<<>>>><><><<>><>>>><<>>><<<<>>>><<>><<<>><<<<>>><<>>><><<>><<>><<<>>>><>><<><<<<>><<<>><<<>>>><>><<<<>><><>>>><<<<>><<<>>><<<<>><<<>><><>>>><<>><>>>><<<<>>>><<<<>>><<<<><<<<><<>>><<<<>>><<<<>>><<<<>>>><>><<><<>><<>>>><<<<>>><<<<>><<<>><>>><<<<><<>>><<<>>>><<><<<>>>><<><>><<><><<<><<<<>>><>>><<>>>><<<<><<>><>>>><<>>>><<<<>>>><<<<>>><><<<<>>>><<>><<>><<<>>>><<>>><>>><>>>><<<<>>><<>>><><>>><<><>>>><<<<>>><<<>><<>><>>>><<><<<>>><<<>>>><<<>>>><<>>>><<<<>>>><<<<><<>>><<>>>><<>>>><<><<<>><<<<><<<<>><<>>>><<><<<<>>><<<><<<<>>><<<>>>><<>>><>><<>>><>>><<>><>>><>>>><<>><<<><<>>>><>>>><<<><>>>><<<<>>>><<<<><><>>><<<>>>><><>>>><<<>><>>><<<>>>><<><<><<<<>>>><>>><<<>><<<><>><<<><><<<>>>><<>><<><<<>>>><<<>>><<<>>>><<<>>>><<<><<>><<<>><><<<>>>><<<<>>><<>><>>>><>><<>>>><<<><<>><<<><<<>>>><<<<><<<<><><<<>>>><><<<<><<<>>>><<<<>><<>><><<<>>><>><<<<>><<<>>>><>>>><<<>>><<<<><<<>>><<>>>><<<<>><<<<>>><><<><<<<><<>><>>><>><>><<<<>>>><><<>>><<<<>>>><<<<>>>><<<>><><<<<>><>>>><<>>><<<<>>><<<>>>><<>>>><<<<><<<<>>><<<>>><<>>>><<<>>>><<<>>>><<<<><<<<>>><<>>>><>>><>><<>><<<>><<<>><>><<>><<><<<<>>>><<<>><<>><<<<>>><<<><><>><<<><<>><<<<>><<>>>><<><<<<>><<<<>>><<<<>>>><<<<>><<<<>><<<>>><>>>><<<>>><<<<>>>><><<<>>><<>>>><<<><<<>><<>>><>>><<>>><>>><<>>><<<><<<>>>><<>><<>><<>>><<>><<<>>>><<<>>>><<<>>><<<><><>>>><<<<><<<>>><<<><>><<<<>>>><<<>><<<<>>><<<>><><<<>><<<<>>><<<><<<>>>><><<<<>>><<<>><<<>><<<<>>><<<<>>><<<<>>>><<>>>><<<<>>><>><<<><<<><>><<<>>><<<>><<<<>><<<<><<><>>>><<><<<>>><<<<>>>><<>><>>>><<<<>>>><<><<<<>><<<<>>><<<>>>><>>>><>><<>><<<><><<<<>>>><><>>><<<>>><<<<>>><<<<>>>><<><<<>>><<>>>><<<><>><><<<<>>>><<<<>>>><<<>>><<<>>>><<>>>><<<>>>><<<>>><>><<<<>><><>><<<<>>>><>>>><<<>><<>>>><<><<<<>>><>>><<<>>>><<<<><<><>>><<<<><<<<>>><<>><><<<<>>>><<<>><>>>><>>>><<>><<<>>>><<<<>>><<<>>>><<<>>>><<>>><<<>>><<<<>><<<<>><>>><<>>><<>>>><<<<>>>><>>><>><<><>>><<<><<>>>><><<<>>><<<><<>>>><<<>>><><<<<>>><<><>>><<>>><>>>><><>><<>>><<>>>><<>>>><<<<>>><>><><<<<>>>><<<<>>><><<>><<<<>><<>><<<>>><<<<>>><<<>>><<<<>><><<<><<<>>>><>>>><<<<>><<<>>><<<><<><<<><>><><<<>>>><<<<>>><<<<>>><<<<><<<>>>><<<<>>>><<<>>><>><><<>><<<>><<><<<<>><<><<<>>><<>>><<>>>><<>>>><><>>>><<<>>>><<<<><<>><<<<>>>><<<>><<<<>><><>>><<<<>>>><<>>><<<>><<<>>><<>>>><<<><<<<>><<>><<<>><<>>>><<>><<<<>>><>>><>><>>>><<<>>><<>>><<<>><<>>><<<<><<<><<>>><<<<>>><>><><<<<><>><>>><>><<><<<<><<>>><>><>><<>>><<>>><>>><<<<>>><<<<>>><<><>><<<<>>><<<<><<>><<<><><>>><>>><<<<>>><<<><<<>><<><>>>><<>><<>><<<<><<<<>><<>>>><>><<><<<>>>><<<>>>><<><<<<>>>><<<>><<<>>>><<<><>>>><<<>><<>><<<>><<<<>>>><<<>>><<<>><<<>>>><<<>>><<>>><<<<>>>><>>>><<>>>><><<<<>><<><<><<>><>>><<>>>><<>>><<<<><<><>><<<<><>><<<<><<<<>><<>>><<<<><>>>><>><<<>>>><<<<>>>><<>><<<<>>><<>>>><<>>><<<<>><<<><<<<>><<<>>><<<>>>><<<>><>><<>>>><<><<><>><>>><>><<<>>><<>>><<<><<<<>>>><<<<>>><<<<>>><<>>><<<<>>>><<><><><>><<>>><<<>>><<<<><>>><>><>><<<<><<<<>><<<<>>><>>>><<<>>><<<>>>><<<>>>><<<<>>>><>>><<<<>>>><><<<><<>>><<<<>>><<>><<>><<<<>>>><<>><><<<<>><<<>>><<<>>><<<<>><<<>>>><<<<>>>><>>><>>>><<>>><<><<><<<>>><<<><<<><>>>><<<<><<>>><<<>><<<<><<<>>><><<<<>>>><<>>>><>>><>><>>>><<<<><<<><<<><<><<>>>><<>>><>>>><<<><<>>><<<>><<><<<><<<><<<>><>>><<<>><>>><<>><>><<<<>>>><<<<>>>><><<<<><<><<<<>>>><>>><<<>>>><>>>><<<>>><<<>>>><<<>>><<<>>>><>>><<<>><>>><<>>>><><<<>><<<><>>>><<<>>>><<<<><<<>>>><>>><<<>><<>><<<<>><<<><<>>><<<>>>><>>>><<<<>>><<<>><>>>><><<<<><<>>>><>>>><<<><<>>>><<<<>>><>>><>>>><><<>>>><<><><><<>><<>>><<<><<>>>><<><<>><<>>>><<<>>>><<><<><<>>><<<>><<<>>>><><<<>>>><<<<><>>>><<<>>><<>><>>>><<<<><<>>><<><>><
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(3215)
  end

  it 'part 2' do
    expect(subject.part2).to eq(1575811209487)
  end
end