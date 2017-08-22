class OwHeroesRoster::CLI

  def call
    puts "Welcome to the Overwatch Heroes Roster Gem!"
    puts "\n----***------ INSTRUCTIONS ------***----"
    puts "\n1. Enter a hero's name to see their details."
    puts "2. To see the roster again, type 'roster'."
    puts "3. To exit the program, type 'exit'."
    puts "\n----------------------------------------"
    Roster.scrape_roster_page
    list_heroes
    menu
  end

  #print the list of heroes scraped from the site
  def list_heroes
    puts "\n---***------  HEROES ------***---"
    @heroes = Hero.all
    Hero.all.each do |hero|
      puts " --- #{hero.name}"
    end
    menu
  end

  #ask user if they'd like to select a hero (by name or number?) for more details, reprint the list, or exit the program
  def menu
    print "\nWhat would you like to do? "
    input = gets.strip.upcase
    if input == 'ROSTER'
      list_heroes
    elsif input == 'EXIT'
      exit
    else
      display_hero(input)
    end
  end

  #display the details of the requested hero. do I want this here?
  def display_hero(input)
    #use a find by name method to get the right hero and then display the information
    if Hero.find_by_name(input)
      hero = Hero.find_by_name(input)
      hero.display_information
      menu
    else
      puts "Sorry could not find a hero by that name. Try again."
      menu
    end
  end

end
