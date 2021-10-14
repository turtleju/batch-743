require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'create an animal' do
      animal = Animal.new('')
      expect(animal).to be_a(Animal)
    end
  end

  describe '::phyla' do
    it 'returns an array with 4 categories' do
      phylas = Animal.phyla
      expect(phylas).to eq([
        'Bilateria',
        'Deuterostomia',
        'Ecdysozoa',
        'Lophotrochozoa'
      ])
    end
  end

  describe '#eat' do
    it 'returns a sentence when eating' do
      animal = Animal.new("Sponge Bob")
      expect(animal.eat('burger')).to eq("Sponge Bob eats a burger")
    end
  end
end
