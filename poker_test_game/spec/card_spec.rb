# RSpec file for the playing cards.
require 'card'

describe Card do
  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    Card.new(**defaults.merge(params))
  end

  it 'has a suit' do
    raise unless Card.new(suit: :spades, rank: 4).suit == :spades
  end

  it 'has a rank' do
    raise unless Card.new(suit: :spades, rank: 4).rank == 4
  end

  describe 'a jack' do
    it 'ranks higher than 10' do
      lower = Card.new(suit: :spades, rank: 10)
      higher = Card.new(suit: :spades, rank: :jack)

      raise unless higher.rank > lower.rank
    end
  end

  describe 'a queen' do
    it 'ranks higher than jack' do
      lower = Card.new(suit: :spades, rank: :jack)
      higher = Card.new(suit: :spades, rank: :queen)

      raise unless higher.rank > lower.rank
    end
  end

  describe 'a king' do
    it 'ranks higher than queen' do
      lower = Card.new(suit: :spades, rank: :queen)
      higher = Card.new(suit: :spades, rank: :king)

      raise unless higher.rank > lower.rank
    end
  end
end
