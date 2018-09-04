require_relative "pile"

class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    if empty? || @cards.length < 13
      return false
    else
      suits = @cards[0].suit
      return true if @cards.all? { |x| x.suit == suits }
    end
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    if empty?
      if @suit == card.suit && card.value == :ace
        return true
      else
        return false
      end
    else
      if @cards.last.rank + 1 == card.rank
        return true
      else
        return false
      end
    end
    return true if @suit == card.suit
    false
  end
end
