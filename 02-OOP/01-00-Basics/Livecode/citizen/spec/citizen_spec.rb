require_relative "../citizen"

describe Citizen do
  describe '#can_vote?' do
    it 'returns true if major' do
      # if I create a citizen and i ask if he can vote, should return true
      citizen = Citizen.new("John", "Doe", 18)
      expect(citizen.can_vote?).to eq(true)
    end

    it 'returns false if minor' do
      # if I create a citizen and i ask if he can vote, should return false
      citizen = Citizen.new("John", "Doe", 17)
      expect(citizen.can_vote?).to eq(false)
    end
  end
end
