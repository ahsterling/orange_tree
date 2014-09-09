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
      @height += 10
      grow_oranges
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
    set_max_age(set_soil_quality)
  end

  def make_trees(tree_num)
    @total_oranges = 0
    @grove = []
    (0..tree_num-1).collect do
      @grove.push(OrangeTree.new)
    end

  end

  def grow_or_pick()
    prompt = "Would you like to <age your trees> or <pick an orange> now?"
    puts prompt
    r = gets.chomp
    while r
      if r[0..2].downcase == "age"
        puts "How many years would you like to age your trees?"
        years = gets.chomp
        years = years.to_i
        years.times do
          one_year_in_grove
          count_all_the_oranges
        end
        puts "There are #{@grove.count} trees in your grove."
        puts "The trees are now #{@grove[0].age} years old."
        puts "The trees are now #{@grove[0].height} inches tall."
        puts "There are #{@total_oranges} oranges on the trees."
        puts "The soil quality is at a level: #{@soil_quality}"
        puts prompt
        r = gets.chomp
      elsif r[0..2].downcase == "pic"
        if @total_oranges != 0
          @total_oranges -= 1
          puts "Yum, that was tasty!"
          puts "Now there are #{@total_oranges} in the grove."
          puts prompt
          r = gets.chomp
        elsif @total_oranges == 0
          puts "Sorry, there are no oranges to pick today!"
          puts prompt
          r = gets.chomp
          end
      elsif r == "exit"
        break
      else
        puts "Sorry, I didn't quite understand that."
        puts prompt
        r = gets.chomp
        end
      end
    end

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

  def set_soil_quality
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


def start
  puts "Welcome! How many orange trees would you like to plant in your orange grove?"
  trees = gets.chomp
  OrangeGrove.new(trees.to_i)
end

start.grow_or_pick
