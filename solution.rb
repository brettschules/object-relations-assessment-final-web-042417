# Movie belongs to viewer and rating.
# Movie has many viewers and movie has many ratings
class Viewer
  attr_accessor :first_name, :last_name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end


  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|cust_name| cust_name.full_name == name}
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end
end

class Rating
  attr_accessor :score, :movie, :viewer
  @@all = []

  def initialize(score)
    @score = score
    @movie = movie
    @viewer = viewer
    @@all << self
  end

  def self.all
    @@all
  end

  def viewer
    Viewer.all.select {|viewer| viewer.rating == self }
  end

  def movie
    viewer.map {|view| view.movie}
  end
end

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

  def find_by_title(title)
    @@all.find {|movie| movie.title = title}
  end

  def ratings
    @@all.map {|movie| movie.rating}
  end

  def viewers
    Viewer.all.select {|viewer| viewer.rating == self}
  end

  def average_rating
    ratings = self.all.map {|movie| movie.rating}
    total_scores = ratings.inject(0, :+)
    total_scores/ratings.length.to_f
  end
end
