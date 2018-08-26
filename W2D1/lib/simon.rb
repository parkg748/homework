class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over == true
    game_over_message
    reset_game
  end

  def take_turn
    if @game_over == false
      show_sequence
      require_sequence
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each { |x| puts 'x' }
  end

  def require_sequence
    
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nice one!"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
