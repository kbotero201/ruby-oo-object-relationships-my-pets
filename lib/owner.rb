require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  attr_writer
  attr_accessor 

  @@all = []

  def initialize(name, species="human")
    @name = name 
    @species = species
    @@all << self
  end 

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end 

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.find_all { |cat| cat.owner == self }
  end 
    
  def dogs
    Dog.all.find_all { |dog| dog.owner == self }
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy" }
  end 

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end 


  def sell_pets
    pets = self.dogs + self.cats
    pets.each {
      |pet| pet.mood = "nervous"
      pet.owner = nil
    }
  end

  def list_pets 
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

