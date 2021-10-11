require 'date'
require 'yaml'

def french_ssn_info(number)
  pattern = /^(?<gender>[12])\s?(?<birth_year>\d{2})\s?(?<birth_month>0[1-9]|1[0-2])\s?(?<department>[0-9][0-9]|2[AB])\s?\d{3}\s?\d{3}\s?(?<key>\d{2})$/

  # regex correction
  # SSN_PATTERN = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<zip>\d{2}|2[AB])\s?(\d{3})\s?(\d{3})\s?(?<key>\d{2})$/
  return 'The number is invalid' unless number.match?(pattern)
  match_data = number.match(pattern)

  key = match_data[:key].to_i
  integer_without_key = number.gsub(/\s/, '')[0..-3].to_i
  return 'The number is invalid' unless valid_key?(integer_without_key, key)

  gender = match_data[:gender].to_i == 1 ? 'man' : 'woman'
  year_of_birth = match_data[:birth_year].to_i < 21 ? "20#{match_data[:birth_year]}" : "19#{match_data[:birth_year]}"
  birth_month = Date::MONTHNAMES[match_data[:birth_month].to_i]
  department = department_name(match_data[:department])

  "a #{gender}, born in #{birth_month}, #{year_of_birth} in #{department}."
end

 # puts french_ssn_info('1 84 12 76 451 089 46')


def department_name(code)
  YAML.load(File.read("data/french_departments.yml"))[code]
end

def valid_key?(integer_without_key, key)
  ((97 - integer_without_key) % 97) == key
end

