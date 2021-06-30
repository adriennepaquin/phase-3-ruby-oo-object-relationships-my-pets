require "pry"

class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{species}."
    #"I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
    # cat_obj = Cat.all.find {|cat| cat.name == cat_name}
    # cat_obj.owner = self

  end

  def buy_dog(name)
    Dog.new(name, self)
    # dog_obj = Dog.all.find {|dog| dog.name == dog_name}
    # dog_obj.owner = self
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
    #dogs.each because self is implicit
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
    #self.all.count
    #all.count
  end

  def self.reset_all
    @@all.clear
  end
end