require_relative 'french_ssn'

if french_ssn_info("") == "The number is invalid"
  puts 'my test is ok'
else
  puts 'my test is nok'
end
