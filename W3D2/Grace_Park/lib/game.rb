require_relative "card"

class Game
  attr_reader :free_cells, :foundations, :tableau, :move_history

  def initialize
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    deal_tableau
    @move_history = []
  end

  def deal_tableau
    card = Card.all_cards.shuffle!
    (0..3).each do |x|
      7.times { @tableau[x].cards << card.pop }
    end
    (4..7).each do |x|
      6.times { @tableau[x].cards << card.pop }
    end
  end

  def move!(from_pile, to_pile)
    to_pile << from_pile.draw
  end

  def move(from_pile, to_pile)
    move!(from_pile, to_pile)
    @move_history << [from_pile, to_pile]
  end

  def undo_move
    from_pile, to_pile = @move_history.pop
    move!(to_pile, from_pile)
  end

  def valid_move?(from_pile, to_pile)
    from_pile.cards.all? { |x| to_pile.valid_move?(x) } ? true : false
    return false if from_pile.empty?
  end

  def won?
    @foundations.all? { |x| x.complete? }
  end
end
