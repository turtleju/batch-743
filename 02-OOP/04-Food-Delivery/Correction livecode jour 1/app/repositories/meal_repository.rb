require 'csv'
require_relative 'base_repository'
require_relative '../models/meal'

class MealRepository < BaseRepository
  private

  def csv_headers
    %w[id name price]
  end

  def csv_row(meal)
    [meal.id, meal.name, meal.price]
  end

  def new_element(row)
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
