require_relative "pile"

class Tableau < Pile
  def to_s
    empty? ? "[  ]" : "[#{cards.join(', ')}]"
  end

  def valid_move?(card)
    if empty?
      true
    else
      if top_card.color != card.color && top_card.rank - 1 == card.rank
        true
      else
        false
      end
    end
  end
end
