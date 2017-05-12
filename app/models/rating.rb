class Rating
  attr_accessor :score
  @@all = []

  def initialize(score)
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

  def movie
    Movie.all.select {|movie| movie.rating == self}
  end
end
