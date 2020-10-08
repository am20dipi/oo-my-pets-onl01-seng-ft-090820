class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @pets = []
    @@all << self
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
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all = []
  end
  
  def cats 
    cats = Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    dogs = Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(cat_name)
    newcat = Cat.new(cat_name, self)
    @@all << newcat
  end
  
  def buy_dog(dog_name)
    newdog = Dog.new(dog_name, self)
    @@all << newdog
  end
  
  def walk_dogs
    @pets.collect do |species, instances|
      if species == dogs 
        Dog.select do |dog| 
          dog.mood = "happy"
        end
      end
    end
  end
  
  def feed_cats
    @pets.collect do |species|
      if species = cats
        Cat.each do |cat|
          cat.mood = "happy"
        end
      end
    end
  end
  
  def sell_pets
    @pets.each {|o| o.owner == nil}
    @pets
  end
  
  def list_pets
    numdogs = @pets[:dogs].size.to_i
    numcats = @pets[:cats].size.to_i
    @owner.list_pets = "I have #{numdogs} dog(s), and #{numcats} cat(s)."
  end
    
    

end