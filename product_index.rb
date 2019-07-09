class Product_Index
	attr_reader :options

	def initialize(type)
		@type = type
		@product_index = 0

		@options = []
		@option_values = []

		@option_product_map = {}
		@product_options = []

		@option_bitmaps = {}
		@product_bitmaps = []
	end


	public

	def add(product)
		options = product["options"]
		@product_options << options

		options.each do |option, value|
			option_index = @options.index(option)
			if option_index == nil
				@options << option
				@option_values << [value]
			else
				@option_values[option_index] << value if @option_values[option_index].index(value) == nil
			end

			@option_product_map[value] = [] if @option_product_map[value] == nil
			@option_product_map[value] << @product_index
		end

		@product_index += 1
	end

	def match_options(options)
		bitmap = ("1" * @product_index).to_i(2)
		options.each do |option|
			raise NameError, "Could not find option #{option}" if @option_bitmaps[option] == nil
			option_bitmap = @option_bitmaps[option]
			bitmap = bitmap & option_bitmap
		end
		# Convert binary int to string with leading zeros
		bitmap = '%0*b' % [@product_index, bitmap]

		result_bitmap_width = @option_values.flatten().length
		result_bitmap = ("0" * result_bitmap_width).to_i(2)
		bitmap.split('').each_with_index do |b, i|
			result_bitmap = result_bitmap | @product_bitmaps[i] if b == "1"
		end
		result_bitmap = '%0*b' % [result_bitmap_width, result_bitmap]

		char_index = 0;
		results = []
		@option_values.each do |values|
			matches = []
			values.each do |value|
				matches << value if result_bitmap[char_index] == "1"
				char_index += 1
			end
			results << matches
		end
		return results
	end

	def generate_bitmaps()
		generate_product_bitmaps()
		generate_option_bitmaps()
	end


	private

	def generate_product_bitmaps()
		values = @option_values.flatten()
		@product_options.each do |options|
			product_bitmap = "0" * values.length
			options.each { |option, value| product_bitmap[values.index(value)] = "1" }
			@product_bitmaps << product_bitmap.to_i(2)
		end
	end

	def generate_option_bitmaps()
		@option_product_map.each do |option, indexes|
			option_bitmap = "0" * @product_index
			indexes.each { |index| option_bitmap[index] = "1" }
			@option_bitmaps[option] = option_bitmap.to_i(2)
		end
	end
end








