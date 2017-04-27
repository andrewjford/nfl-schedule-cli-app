class Team
  attr_accessor :name,:team_url,:schedule

  @@all_teams = []

  def self.create(name)
    #unless @@all_teams.detect{|team| team.name == name}
      new_team = Team.new(name)
      @@all_teams << new_team
      new_team
    #end
  end

  def self.all_teams
    @@all_teams
  end

  ### Instance methods ###

  def initialize(name)
    @name = name
  end

end
