class Console
	attr_reader :type, :options

	def initialize()
		args = ARGV
		@type = args[0]
		@options = args[1..-1]
	end
end