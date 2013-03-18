require_relative "html_generator"

# Access parameters passed into the app.

  if ARGV.empty? #(argument vector)
    puts "USAGE: bla bla bla"
  else
    puts "Ya, you passed in some arguments. :)"
    generator = HtmlGenerator.new
    if ARGV[0] == "index"
        generator.index
    
    elsif ARGV[0] == "show"
      puts "Action: show"
        generator.show
    else
      puts "Urecognized action. Please refer to USAGE."
    end
  end
