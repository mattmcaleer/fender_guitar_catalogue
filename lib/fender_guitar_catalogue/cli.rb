class CLI

    def title
        puts "================================="
        puts "=====FENDER GUITAR CATALOGUE====="
        puts "================================="
        menu
    end

    def menu
        puts "What would you like to do?"
        puts "1. View Electric Guitars"
        puts "2. View Acoustic Guitars"
        puts "3. View Bass Guitars"
        puts "4. Exit"
        input = gets.chomp
        if input == "1"
            puts ""
            Scraper.new.scrape("electric")
            puts ""
            show_details
        elsif input == "2"
            puts ""
            Scraper.new.scrape("acoustic")
            puts ""
            show_details
        elsif input == "3"
            puts ""
            Scraper.new.scrape("bass")
            puts ""
            show_details
        elsif input == "4"
            puts "Goodbye!"
        else
            puts "Invalid selection."
            menu
        end
    end

    def show_details
        puts "Which guitar would you like information on?"
        input = gets.chomp.to_i
        puts ""
        if input < 1 || input > Guitar.all.count
            puts "!Invalid selection - Please choose a different model!"
            puts ""
            show_details
        else
            puts Guitar.all[input-1].item_desc
        end
        anything_else
    end

    def anything_else
    puts "Anything else? (Y/N)"
    input = gets.chomp
    puts ""
        if input.downcase == "y"
            Guitar.all.clear
            system("clear")
            menu
        elsif input.downcase == "n"
            puts "Goodbye"
            system("clear")
        else 
            puts "Invalid selection."
            anything_else
        end
    end
    
end
