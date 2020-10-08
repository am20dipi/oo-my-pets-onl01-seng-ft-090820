class Owner
  attr_accessor :name, :pets
  attr_reader :species
  
  @@owners = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @pets = {dogs:[], cats:[]}
    @@owners << self
  end
  
  def name= (name)
    if self.name != name
      raise NoMethodError
    else
      self.name = name
    end
  end

  
  def species= (species)
    if self.species != species
      raise NoMethodError
    else
      self.species = species
    end
  end
    
  def species
    @species = "human"
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all
    @@owners
  end
  
  def self.count
    @@owners.count
  end
  
  def self.reset_all
    @@owners= []
  end
  
  def cats 
    cats = Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    dogs = Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(cat_name)
    newcat = Cat.new(cat_name, self)
    @@owners << newcat
  end
  
  def buy_dog(dog_name)
    newdog = Dog.new(dog_name, self)
    @@owners << newdog
  end
  
  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
    dog.mood
  end
  
  def feed_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    pets.each do |species, animals|
      animals.each do |animal|
        animal.mood = "nervous"
      end
      animals.clear
    end
  end
  
  def list_pets
    "I have #{pets[:dogs]} dog(s), and #{pets[:cats]} cat(s)."
  end
    
    

end