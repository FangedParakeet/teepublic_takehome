require_relative 'reader'
require_relative 'manager'
require_relative 'console'

describe Manager do

	before(:all) do 
		reader = Reader.new("products.json")
		products = reader.getProducts()

		@manager = Manager.new(products)
		@manager.createIndexes()
	end

	describe "inputs" do 
		it "finds the correct options for product type" do 
			tshirt_options = @manager.getOptions("tshirt")
			mug_options = @manager.getOptions("mug")
			sticker_options = @manager.getOptions("sticker")

			expect(tshirt_options).to eq(["gender", "color", "size"])
			expect(mug_options).to eq(["type"])
			expect(sticker_options).to eq(["size", "style"])
		end

		it "throws an exception for empty product type" do 
			expect { @manager.getOptions("") }.to raise_error(NameError)
			expect { @manager.query("", []) }.to raise_error(NameError)
		end

		it "throws an exception for invalid product type" do 
			expect { @manager.getOptions("doesntexist") }.to raise_error(NameError)
			expect { @manager.query("doesntexist", []) }.to raise_error(NameError)
		end

		it "throws an exception for empty option type" do
			expect { @manager.query("tshirt", [""]) }.to raise_error(NameError)
		end

		it "throws an exception for invalid option type" do
			expect { @manager.query("tshirt", ["doesntexist"]) }.to raise_error(NameError)
		end
	end

	describe "tshirt" do
		it "returns all options with product type tshirt only" do 
			result_options = @manager.query("tshirt", [])

			expect(result_options).to eq([["male", "female"], ["red", "green", "navy", "white", "black"], ["small", "medium", "large", "extra-large", "2x-large"]])
		end

		it "returns no male gender for tshirt female" do
			result_options = @manager.query("tshirt", ["female"])

			expect(result_options).to eq([["female"], ["red", "green", "navy", "white", "black"], ["small", "medium", "large", "extra-large", "2x-large"]])
		end
	end

	describe "sticker" do
		it "returns all options with product type sticker only" do 
			result_options = @manager.query("sticker", [])

			expect(result_options).to eq([["x-small", "small", "medium", "large", "x-large"], ["matte", "glossy"]])
		end

		it "returns only small for sticker small" do
			result_options = @manager.query("sticker", ["small"])

			expect(result_options).to eq([["small"], ["matte"]])
		end
	end

	describe "mug" do 
		it "returns all options with product type mug only" do 
			result_options = @manager.query("mug", [])

			expect(result_options).to eq([["coffee-mug", "travel-mug"]])
		end

		it "returns only one result for mug coffee-mug" do
			result_options = @manager.query("mug", ["coffee-mug"])

			expect(result_options).to eq([["coffee-mug"]])
		end
	end

end