require 'pry-byebug'

def normalize_word(word)
  word.strip.capitalize + ' !'
end

def full_name(first_name, last_name)
  binding.pry
  first_name_normalized = normalize_word(first_name)
  last_name_normalized = normalize_word(last_name)
  return "#{first_name_normalized}, #{last_name_normalized}"
end

puts full_name('   john', '   lennon')


## Commandes
# continue => Go to next binding.pry
# next => execute next line
# step => go to next operation
# help => access to all shortcuts
