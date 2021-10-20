class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(csv_path)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private


  def save_csv
    CSV.open(@csv_path, 'wb', headers: :first_row) do |csv|
      csv << csv_headers
      @elements.each do |element|
        csv << csv_row(element)
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |row|
      row[:id] = row[:id].to_i
      @elements << new_element(row)
    end

    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
