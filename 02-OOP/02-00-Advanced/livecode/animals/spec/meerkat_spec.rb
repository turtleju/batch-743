require_relative '../meerkat'

describe Meerkat do
  describe '#talk' do
    it 'returns barks' do
      meerkat = Meerkat.new('Timon')
      expect(meerkat.talk).to eq('Timon barks')
    end
  end
end
