def calculator(number_one, number_two, operator)
  case operator
  when "+"
    res = number_one + number_two
  when "-"
    res = number_one - number_two
  when "*"
    res = number_one * number_two
  else "/"
    res = number_one.to_f / number_two
  end
  res
end
