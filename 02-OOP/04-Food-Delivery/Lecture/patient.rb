class Patient
  attr_reader :name
  attr_accessor :room
  attr_accessor :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  # already in attr writer (in accessor)
  # def room=(instance_of_room)
  #   @room = instance_of_room
  # end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end



george = Patient.new(name: 'george')
# puts george.cured?
# george.cure!
# puts george.cured?

# Patient.new(room: )




CSV.foreach(csv_file, csv_options) do |row|
  row[:id]    = row[:id].to_i          # Convert column to Integer
  row[:cured] = row[:cured] == "true"  # Convert column to boolean
  patients << Patient.new(row)
end
