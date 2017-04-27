class CLI

  def run
    puts "Welcome."
    Scraper.add_teams("http://www.cbssports.com/nfl/teams")
    Team.all_teams.each do |team|
      Scraper.add_schedule(team)
      puts "loading... #{team.name}"
    end
    self.main
  end

  #main loop
  def main
    running = true
    while running

      self.list_confs

      # num = 1
      # Team.all_teams.each do |team|
      #   puts "#{num}. #{team.name}"
      #   num += 1
      # end
      self.schedule_loop

      print "Would you like to continue? (y/n): "
      input = gets.chomp
      if input == "n" || input == "N"
        running = false
      end
    end
  end

  def list_confs
    running = true
    while running
      print "Enter (a) to list AFC teams, (n) to list NFC teams, or (c) to choose a team for further details: "
      input = gets.chomp
      if input == "a"
        for index in (0..15)
          puts "#{index+1}. #{Team.all_teams[index].name}"
        end
      elsif input == "n"
        for index in (16..31)
          puts "#{index+1}. #{Team.all_teams[index].name}"
        end
      else
        running = false
      end
    end
  end

  def schedule_loop
    running = true
    while running
      print "Enter a team number to see that team's schedule: "
      input = gets.chomp
      if input == "n"
        running = false
      elsif input.to_i >= 0 && input.to_i < Team.all_teams.length
        puts Team.all_teams[input.to_i-1].schedule
      else
        running = false
      end
    end
  end

end
