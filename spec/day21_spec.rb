# frozen_string_literal: true

require_relative '../day21/day21'

RSpec.describe Day21MonkeyMath do
  let(:input_lines) do
    data = <<~INPUT_DATA
      root: pppw + sjmn
      dbpl: 5
      cczh: sllz + lgvd
      zczc: 2
      ptdq: humn - dvpt
      dvpt: 3
      lfqf: 4
      humn: 5
      ljgn: 2
      sjmn: drzm * dbpl
      sllz: 4
      pppw: cczh / lfqf
      lgvd: ljgn * ptdq
      drzm: hmdt - zczc
      hmdt: 32
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(152)
  end

  it 'part 2' do
    expect(subject.part2).to eq(301)
  end
end
