class Scraper

  def self.scrape_for_teams(url)
    doc = Nokogiri::HTML(open(url))
    team_rows = doc.css(".teamsList tr")

    team_rows.each do |row|
      team_name = row.css("td > a:first-child + a").text

      #these elements we are looping through have blanks so
      #only create teams with a name
      if team_name != ""
        site = row.css("td > a:first-child + a + span > a:first-child").attribute("href").value

        new_team = Team.create(team_name)
        new_team.schedule_url = url + site
      end
    end
  end

  def self.scrape_team_schedule(url)
    #to complete
  end

  def self.make_teams(url)
    Scraper.scrape_for_teams(url).each do |team|
      Team.create(team.text)
    end
  end

  def self.make_schedules
    #to complete
  end

end
