class OwHeroesRoster::CLI

  def call
    puts "Welcome to the Overwatch Heroes Roster Gem!"
    menu
  end

  #print the list of heroes scraped from the site
  def list_heroes

  end

  #ask user if they'd like to select a hero (by name or number?) for more details, reprint the list, or exit the program
  def menu
    puts "\n---***------ INSTRUCTIONS ------***---"
    puts "\n1. Enter a hero's name to see their details."
    puts "2. To see the roster again, type 'roster'."
    puts "3. To exit the program, type 'exit'."
    input = gets.strip.downcase
    if input == 'roster'
      list_heroes
    elsif input == 'exit'
      exit
    else
      display_hero(input)
    end
  end

  #display the details of the requested hero. do I want this here?
  def display_hero(input)
    #validate input (here or above?)

    #case statement for heroes? or instead do a find_by_name type deal?
    #Yeah that seems better, let's nix the numbers thing and go with that
  end

end
