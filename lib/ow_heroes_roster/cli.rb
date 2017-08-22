class OwHeroesRoster::CLI

  def call
    puts "Welcome to the Overwatch Heroes Roster Gem!"
    list_heroes
    menu
  end

  #print the list of heroes scraped from the site
  def list_heroes
    puts "\n---***------  HEROES ------***---"
    Roster.scrape_roster_page
    Roster.display
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
  def display_hero(name)
    #use a find by name method to get the right hero and then display the information
    
  end

end
