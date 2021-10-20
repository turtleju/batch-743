require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  private

  def csv_headers
    %w[id name address]
  end

  def csv_row(customer)
    [customer.id, customer.name, customer.address]
  end

  def new_element(row)
    Customer.new(row)
  end
end
