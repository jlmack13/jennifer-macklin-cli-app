require 'colorize'

class OwHeroesRoster::CLI

  def call
    puts "\nWELCOME TO THE OVERWATCH HEROES ROSTER GEM!".colorize(:green)
    puts "\n----***------ INSTRUCTIONS ------***----".colorize(:white)
    puts "\n1. Enter a hero's name to see their details.".colorize(:white)
    puts "2. To see the roster again, type 'roster'.".colorize(:white)
    puts "3. To exit the program, type 'exit'.".colorize(:white)
    puts "\n----------------------------------------".colorize(:white)
    Roster.scrape_roster_page
    list_heroes
    menu
  end

  #print the list of heroes scraped from the site
  def list_heroes
    puts "\n---***------  HEROES ------***---".colorize(:yellow)
    @heroes = Hero.all
    Hero.all.each do |hero|
      print " --- ".colorize(:magenta)
      puts "#{hero.name}".colorize(:white)
    end
    menu
  end

  #ask user if they'd like to select a hero (by name or number?) for more details, reprint the list, or exit the program
  def menu
    print "\nWhat would you like to do? ".colorize(:green)
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
      puts "\nSorry could not find a hero by that name. Please try again.".colorize(:green)
      menu
    end
  end

end
