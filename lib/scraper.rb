class Scraper

  def self.scrape_for_teams(url)
    doc = Nokogiri::HTML(open(url))
    team_rows = doc.css(".teamsList tr")
    team_rows
  end

  def self.add_teams(url)
    team_rows = Scraper.scrape_for_teams(url)
    team_rows.each do |row|
      team_name = row.css("td > a:first-child + a").text

      #these elements we are looping through have blanks so only
      #process rows with a team name
      if team_name != ""
        site = row.css("td > a:first-child + a").attribute("href").value

        new_team = Team.create(team_name)
        new_team.team_url = url.gsub("/nfl/teams","") + site
      end
    end
  end

  def self.scrape_team_schedule(team_url)
    #scrapes team url and returns schedule data
    doc2 = Nokogiri::HTML(open(team_url))
    schedule_rows = doc2.css("section.recentSchedule tr.preEvent")
    schedule_rows
  end

  def self.add_schedule(team)
    #takes team, runs scrape on team url, adds schedule data to team object
    schedule_rows = Scraper.scrape_team_schedule(team.team_url)

    team.schedule = []
    schedule_rows.each do |row|
      date = row.css('.gameDate').text
      time = row.css('.gameDateTime > div > span:first-child').text
      opp = row.css('.gameMatchup').text
      team.schedule << Game.new(date,time,opp)
      binding.pry
    end
  end

end
