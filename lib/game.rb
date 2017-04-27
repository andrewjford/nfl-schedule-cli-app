class Game
  attr_accessor :date,:time,:opponent

  def initialize(date,time,opponent)
    @date = date
    @time = time
    @opponent = opponent
  end
end
