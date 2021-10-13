class SlotMachine
  SYMBOLS = %w[cherry seven bell star joker]
  attr_reader :reels

  def initialize(reels)
    @reels = reels
  end

  def score
    if @reels.uniq.size == 1
      base_score(@reels[0]) * 2
    elsif @reels.uniq.size == 2 && @reels.include?('joker')
      # Tips : for 3 values, if I have 2 values and I sort, the middle value is one who appears twice
      reel_to_take = @reels.sort[1]
      base_score(reel_to_take)
    else
      0
    end
  end

  def play
    @reels = []
    3.times do
      @reels << SYMBOLS.sample
    end
  end

  private

  def base_score(reel)
    case reel
    when 'cherry' then 5
    when 'seven' then 10
    when 'bell' then 15
    when 'star' then 20
    when 'joker' then 25
    end
  end
end
