class OrangeTree

  attr_accessor :height, :age, :oranges, :max_age

  def initialize
    @height = 0
    @age = 0
    @oranges = 0
    @max_age = 20
  end

  def one_year_passes
    if @age < max_age
      @oranges = 0
      @age += 1
      #puts "Current age: #{@age}"
      @height += 10
      #puts "Current height: #{@height}"
      grow_oranges
      #puts "Current # of oranges: #{@oranges}"
    else
      die
    end
  end

  def count_the_oranges
    puts "There are currently #{@oranges} oranges on this tree."
  end

  def puts_height
    puts "Your orange tree is currently #{@height} inches tall."

  end

  def die
    puts "I'm sorry, this tree is dead."
    exit
  end

  def grow_oranges
    if @age >= 5 && @age < 10
      @oranges += 5
    elsif @age >= 10 && @age < 15
      @oranges += 10
    elsif @age >= 15 && @age < @max_age
      @oranges += 50
    end

  end

  def pick_an_orange
    if @oranges != 0
      @oranges -= 1
      puts "Yum, that was tasty!"
      puts "Now there are #{@oranges} oranges left on the tree."
    elsif @oranges == 0
      puts "Sorry, there are no oranges to pick today!"
    end
  end
end

class OrangeGrove

  attr_accessor :grove, :total_oranges, :soil_quality, :max_age

  def initialize(tree_num)
    make_trees(tree_num)
    set_max_age(soil_quality)
  end

  def make_trees(tree_num)
    @total_oranges = 0
    @grove = []
    (0..tree_num-1).collect do
      @grove.push(OrangeTree.new)

    end
  end

  def start
    puts "Welcome! How many orange trees would you like to plant in your orange grove?"
    trees = gets.chomp
    o = OrangeGrove.new(trees.to_i)
  end

  def grow_your_trees
  end

  def one_year_in_grove
    #set_max_age(@soil_quality)
    @grove.each do |o|
      o.one_year_passes
      #count_all_the_oranges
    end
  end

  def count_all_the_oranges
    @total_oranges = 0
    @grove.each do |o|
      @total_oranges = @total_oranges + o.oranges.to_i
    end
    return @total_oranges
  end

  def show_me_the_trees
    @grove.each do |n|
      puts "Tree #{@grove.index(n)}: #{n}"
    end
  end

  def set_max_age(soil_quality)
    if soil_quality == 1
      @grove.each do |o|
        o.max_age = 55
      end
    elsif soil_quality == 2
      @grove.each do |o|
        o.max_age = 50
      end
    elsif soil_quality == 3
      @grove.each do |o|
        o.max_age = 35
      end
    elsif soil_quality == 4
      @grove.each do |o|
        o.max_age = 25
      end
    elsif soil_quality == 5
      @grove.each do |o|
        o.max_age = 20
      end
    end
  end

  def soil_quality
    if @grove.count <= 10
      @soil_quality = 5
    elsif @grove.count > 10 && @grove.count <= 20
      @soil_quality = 4
    elsif @grove.count > 20 && @grove.count <= 30
      @soil_quality = 3
    elsif @grove.count > 30 && @grove.count <= 40
      @soil_quality = 2
    elsif @grove.count > 40
      @soil_quality = 1
    end
  end

end

puts "How many oranges trees would you like to plant in your grove?"
input = gets.chomp

o = OrangeGrove.new(input.to_i)

#o.show_me_the_trees
#o.one_year_in_grove
#o.count_all_the_oranges
puts "Max Age for trees in this grove is: #{o.grove[0].max_age}"
puts "To start, you have #{o.grove.count} trees and #{o.count_all_the_oranges} oranges."
puts "How many years would you like to age your grove?"
print "> "
years = gets.chomp
(1..years.to_i).each do |n|
  o.one_year_in_grove
  puts "Year #{n}: You have #{o.grove.count} trees in the grove and #{o.count_all_the_oranges} oranges."

end
puts "The soil quality has a rating of: #{o.soil_quality}"
puts "Your trees are currently #{o.grove[0].height} inches tall."
