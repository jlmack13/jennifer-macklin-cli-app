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
    puts "\n1. To see details about a hero, enter the hero's name or number."
    puts "2. To see this list again, type 'list'."
    puts "3. To exit the program, type 'exit'."
    input = gets.strip.downcase
    if input == 'list'
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
  end

end
