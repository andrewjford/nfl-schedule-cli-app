class CLI

  def run
    puts "Welcome."
    Scraper.scrape_for_teams("http://www.cbssports.com/nfl/teams")
    #main loop

    running = true
    while running
      Team.all_teams.each do |team|
        puts "#{team.name}   #{team.schedule_url}"
      end
      print "Would you like to continue? (y/n): "
      input = gets.chomp
      if input == "n" || input == "N"
        running = false
      end
    end

  end

end
