require_relative "html_generator"

# Access parameters passed into the app.

  if ARGV.empty? #(argument vector)
    puts "USAGE: bla bla bla"
  else
    
    generator = HtmlGenerator.new
    if ARGV[0] == "index"
      generator.index
    elsif ARGV[0] == "show"
      id = ARGV[1]
      generator.show(id)
    else
      puts "Urecognized action. Please refer to USAGE."
    end
  end
puts ARGV.inspect
