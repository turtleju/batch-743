require_relative '../french_ssn'

describe '#french_ssn_info' do
  it 'returns invalid when number is invalid' do
    result = french_ssn_info('123')
    expect(result).to eq('The number is invalid')
  end

  it 'returns string when number is valid' do
    result = french_ssn_info("1 84 12 76 451 089 46")
    expect(result).to eq("a man, born in December, 1984 in Seine-Maritime.")
  end

  it 'returns invalid when key is false' do
    result = french_ssn_info("1 84 12 76 451 089 45")
    expect(result).to eq('The number is invalid')
  end
end

