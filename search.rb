require_relative 'reader'
require_relative 'manager'
require_relative 'console'

begin
	reader = Reader.new("products.json")
	products = reader.getProducts()

	manager = Manager.new(products)
	manager.createIndexes()

	console = Console.new()
	type = console.type
	options = console.options

	results = manager.query(type, options)
	result_options = manager.getOptions(type)

	results.each_with_index do |result_list, i|	
		puts "#{result_options[i].capitalize}: " + result_list.join(", ") if result_list.length > 0
	end
rescue StandardError => e 
	puts e.message
end