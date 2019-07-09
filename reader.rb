require 'json'

class Reader
	def initialize(filename)
		@filename = filename
	end

	def getProducts()
		file = File.read(@filename)
		JSON.parse(file)
	end
end