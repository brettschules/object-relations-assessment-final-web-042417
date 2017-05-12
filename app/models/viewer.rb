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
