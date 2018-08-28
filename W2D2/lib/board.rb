class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        until cup.length == 4
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    on_hand = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos + 1
    until on_hand.empty?
      i = 0 if i > 13
      if i == 6
        @cups[i] << on_hand.pop if current_player_name == @name1
      elsif i == 13
        @cups[i] << on_hand.pop if current_player_name == @name2
      elsif i != 6 && i != 13
        @cups[i] << on_hand.pop
      end
      i += 1
    end
    render
    next_turn(i - 1)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |x| @cups[x].empty? } || (7..12).all? { |x| @cups[x].empty? }
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length < @cups[13].length
      @name2
    elsif @cups[6].length == @cups[13].length
      :draw
    end
  end
end
