require_relative '../slot_machine'

def test_scenario(score, reels)
  it "returns #{score} if #{reels[0]}, #{reels[1]}, #{reels[2]}" do
    slot_machine = SlotMachine.new(reels)
    expect(slot_machine.score).to eq(score)
  end
end


describe SlotMachine do
  describe '#score' do
    # 3 jokers
    test_scenario(50, %w[joker joker joker])

    # two same values
    test_scenario(20, %w[joker star star])
    test_scenario(15, %w[joker bell bell])
    test_scenario(10, %w[joker seven seven])
    test_scenario(5, %w[joker cherry cherry])

    test_scenario(25, %w[joker joker cherry])
    test_scenario(25, %w[joker joker bell])
    test_scenario(25, %w[joker joker seven])
    test_scenario(25, %w[joker joker star])

    test_scenario(0, %w[star bell seven])
  end
end
