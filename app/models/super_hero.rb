class SuperHero

  attr_accessor :name, :power, :bio

  def initialize(params={})
    @name = params[:name]
    @power = params[:power]
    @bio = params[:bio]
    @@all << self
  end

  @@all = []

  def self.all
    @@all 
  end

end
