require 'date'

# date de Noël - date d'aujourd'hui => nbre de jours

def next_xmas
  today = Date.today
  year = today.year
  current_xmas = Date.new(year, 12, 25)

  if today < current_xmas
    return current_xmas
  else
    return current_xmas.next_year
  end
end

def days_before_xmas
  today = Date.today
  (next_xmas - today).to_i
end

p days_before_xmas
