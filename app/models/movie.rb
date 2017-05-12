class Movie
  attr_accessor :title, :viewer, :rating
  @@all = []

  def initialize(title)
    self.title = title
    @viewer = viewer
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  def ratings
    @@all.map {|movie| movie.rating}
  end

  def viewers
    Viewers.all.select {|viewer| viewer.rating == self}
  end

  def average_rating
  end
end
