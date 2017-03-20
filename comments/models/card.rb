class Card
  HIDDEN_FACE = '**'.freeze
  PICTURE_FACES = %w(K Q J).freeze
  ACE = 'A'.freeze

  def initialize(face, suit)
    @face = face
    @suit = suit
    @points = points
  end

  def points
    return 11 if @face == ACE
    return 10 if PICTURE_FACES.include?(@face)
    @face
  end

  def to_s
    "#{@face}#{@suit}"
  end

  def hidden
    HIDDEN_FACE
  end
end
