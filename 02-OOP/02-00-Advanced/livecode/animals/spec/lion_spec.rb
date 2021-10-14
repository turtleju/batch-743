require_relative '../lion'

describe Lion do
  describe '#talk' do
    it 'returns roars' do
      lion = Lion.new('Simba')
      expect(lion.talk).to eq('Simba roars')
    end
  end

  describe '#eat' do
    it 'returns a sentence when eating' do
      lion = Lion.new("Simba")
      expect(lion.eat('gazelle')).to eq(
        "Simba eats a gazelle. Law of the Jungle!"
      )
    end
  end
end
