require_relative 'product_index'

class Manager

	def initialize(products)
		@products_by_type = {}
		@indexes_by_type = {}

		products.each do |product|
			type = product["product_type"]
			@products_by_type[type] ||= []
			@products_by_type[type] << product
		end
	end

	def query(type, options)
		raise NameError, "Could not find product type #{type}"  if @indexes_by_type[type] == nil
		product_index = @indexes_by_type[type]
		results = product_index.match_options(options)
	end

	def getOptions(type)
		raise NameError, "Could not find product type #{type}"  if @indexes_by_type[type] == nil
		product_index = @indexes_by_type[type]
		return product_index.options
	end

	def createIndexes
		@products_by_type.each do |type, products|
			product_index = Product_Index.new(type)

			products.each do |product|
				product_index.add(product)
			end

			product_index.generate_bitmaps()
			@indexes_by_type[type] = product_index
		end
	end
end