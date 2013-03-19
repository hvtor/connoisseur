require 'json'
require 'open-uri'

class HtmlGenerator

	def show 
		print_header
		puts "Action: Show"

		product = retrieve_data("http://lcboapi.com/products/#{id}.json")
		print_footer
	end

	def index
		print_header
		puts "Action: Index"

		products = retrieve_data
		products.each do |x| 
			display_product(x)
		end
		print_footer
	end

	private 

	def display_product(product)
		puts "<h1 align:left>#{product['name']}</h1>"
		puts "<img src=#{product['image_thumb_url']}"
		puts "<ul style="none">"
		puts "<li>#{product['id']}</li>"
		puts "<li>#{product['producer_name']}</li>"
		puts "<li>#{product['primary_category']}</li>"
		puts "<li>#{product['secondary_category']}</li>"
		puts "<li>$#{(product['price_in_cents']*0.01/product['total_package_units']).float}</li>"
		puts "</ul>"
	ends

	def print_header
		puts "<html>"
		puts "   <head>"
		puts "   </head>"
		puts "</html>"
	end	

	def print_footer
    	puts "  </body>"
    	puts "</html>"
  	end

	def retrieve_data()
		response = open("http://lcboapi.com/products.json").read
		data = JSON.parse(response)
		return data["result"]
	end
end