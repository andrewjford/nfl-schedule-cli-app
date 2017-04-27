class Scraper

  def self.scrape_for_teams(url)
    doc = Nokogiri::HTML(open(url))
    teams = doc.css(".teamsList tr td > a:first-child + a")
    teams
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
