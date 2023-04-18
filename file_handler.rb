module FileHandler
  def self.read_file(filename)
    # Check if the file exists
    if File.exist?(filename)
      # Read the content of the file
      file_content = File.read(filename)
      # Parse the JSON data
      json_data = JSON.parse(file_content)
      # Return the parsed JSON data
      json_data
    else
      puts "File #{filename} does not exist."
      return nil
    end
  end

  def self.save(collection, filename)
    data = []
    collection.each do |item|
      object = {}
      item.instance_variables.each do |var|
        object[var.to_s.delete('@')] = "#{item.instance_variable_get(var)}"
      end
      data.push(object)
    end
    return if data.empty?

    File.write("./data/#{filename}", JSON.pretty_generate(data))
  end
end
