# frozen_string_literal: true

require_relative '../day09/day09'

RSpec.describe Day09RopeBridge do
  subject { described_class.new(input_lines) }

  context 'part 1' do
    let(:input_lines) do
      data = <<~INPUT_DATA
        R 4
        U 4
        L 3
        D 1
        R 4
        D 1
        L 5
        R 2
      INPUT_DATA

      data.split("\n")
    end

    it do
      expect(subject.part1).to eq(13)
    end
  end

  context 'part 2' do
    let(:input_lines) do
      data = <<~INPUT_DATA
        R 5
        U 8
        L 8
        D 3
        R 17
        D 10
        L 25
        U 20
      INPUT_DATA

      data.split("\n")
    end

    it do
      expect(subject.part2).to eq(36)
    end
  end
end
