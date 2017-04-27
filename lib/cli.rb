class CLI

  def run
    puts "Welcome to NFL Team Schedules."
    puts "Enter (a) to list AFC teams, (n) to list NFC teams, (1-32) to get a team schedule, (h) to list a team's recent headlines, or (x) to exit: "
    puts ""
    Scraper.add_teams("http://www.cbssports.com/nfl/teams")
    self.main
  end

  def main
    running = true
    prev_input = nil
    while running

      if prev_input.to_i > 0 && prev_input.to_i <= Team.all_teams.length
        print "AFC teams(a), NFC teams(n), team schedules(1-32), headlines(h), exit(x): "
      else
        print "AFC teams(a), NFC teams(n), team schedules(1-32), exit(x): "
      end

      input = gets.chomp

      if input == "a"
        self.print_afc

      elsif input == "n"
        self.print_nfc

      elsif input == "x"
        running = false

      elsif input == "h"
        if prev_input.to_i > 0 && prev_input.to_i <= Team.all_teams.length
          self.print_headlines(prev_input)
        else
          puts "Your previous selection must be a team number to view a team's headlines."
        end

      #if input is 1-32
      elsif input.to_i > 0 && input.to_i <= Team.all_teams.length
        self.print_schedule(input)
      end
      #save previous input (to implement headlines function)
      prev_input = input
    end
  end

  def print_afc
    puts ""
    puts "AFC"
    for index in (0..15)
      puts "#{index+1}. #{Team.all_teams[index].name}"
    end
    puts ""
  end

  def print_nfc
    puts ""
    puts "NFC"
    for index in (16..31)
      puts "#{index+1}. #{Team.all_teams[index].name}"
    end
    puts ""
  end

  def print_schedule(team_num)
    team = Team.all_teams[team_num.to_i-1]
    Scraper.add_schedule(team)

    puts ""
    puts "#{team.name} - Schedule"
    puts "Date        Time          Opponent"
    puts "----------------------------------"
    team.schedule.each do |game|
      date_formatted = self.set_format(game.date,10)
      time_formatted = self.set_format(game.time,12,false)
      opponent_formatted = self.set_format(game.opponent,7,false)
      puts "#{date_formatted} #{time_formatted}    #{opponent_formatted}"
    end
    puts ""
  end

  def set_format(string, d_length, l_just = true)
    string_copy = string
    while string_copy.length < d_length
      if l_just
        string_copy = string_copy + " "
      else
        string_copy = " " + string_copy
      end
    end
    string_copy
  end

  def print_headlines(team_num)
    team = Team.all_teams[team_num.to_i-1]
    headlines = Scraper.scrape_headlines(team.team_url)

    puts ""
    puts "Latest Headlines - #{team.name}"
    headlines.each do |headline|
      puts headline
    end
    puts ""
  end

end
