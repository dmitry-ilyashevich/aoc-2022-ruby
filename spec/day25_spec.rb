# frozen_string_literal: true

require_relative '../day25/day25'

RSpec.describe Day25FullOfHotAir do
  let(:input_lines) do
    data = <<~INPUT_DATA
      1=-0-2
      12111
      2=0=
      21
      2=01
      111
      20012
      112
      1=-1=
      1-12
      12
      1=
      122
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq('2=-1=0')
  end
end
