require_relative '../warthog'

describe Warthog do
  describe '#talk' do
    it 'returns grunts' do
      warthog = Warthog.new('Pumba')
      expect(warthog.talk).to eq('Pumba grunts')
    end
  end
end
