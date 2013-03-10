# A game that shows user two black card and two white card options and asks
# them to choose the winning combination (pair) User has a
# username, points they have gained from ??????


# Cards Against Humans

# Class Playa
# # User class has many entries, username, total tiers, total points
#   @@no_of_entries
#   #pass in username from user
#   def initialize(username)
#     @username=username
#   end
#   @total_tiers
#   @total_points
# end
#!/usr/bin/ruby


require 'sqlite3'



class Entry
# Entry class has one black card, one white card, wins, losses
  # initialize pass in w, b
  def initialize(white, black)
    @white = white
    @black = black
  end
  # to string
  def to_s
    return @white.to_s + @black.to_s
  end
end


class WhiteCard
#initialize passes input text
  def initialize(text)
    @text = text
  end
  def to_s
    return @text
  end
end

class BlackCard
  #initialize passes input text
  def initialize(text, blanks)
    @text = text
    @blanks = blanks
  end
  def to_s
    return @text
  end
end

# new objects cards in variables white cards, black cards
w1 = WhiteCard.new("Der")
w2 = WhiteCard.new("Yar")
w3 = WhiteCard.new("Alright ")
w4 = WhiteCard.new("Tuesday ")
# also passes in blanks
b1 = BlackCard.new("I'm a funny black card ", 1)
# b2 = BlackCard.new("b2", 1)
# array to hold entries
entry = Array.new()
# new objects entries in variables entries
entry[0] = Entry.new(b1, w1)
entry[1] = Entry.new(b1, w2)
entry[2] = Entry.new(b1, w3)
entry[3] = Entry.new(b1, w4)
white = [w1, w2, w3, w4]
black = [b1]
# out to user
puts entry[0], entry[1]
puts "Which is funnier?"
# get users choice
choice = gets.chomp
# create an array to hold stats for choice
nums = [choice]
  puts nums[0]
  puts nums[1]
  puts nums[2]

#loop until we run out of white cards
i = 2
until i == white.length do
  puts entry[i], entry[i+1]
  puts "Which is funnier?"
  choice = gets.chomp
  nums.push(choice)
  puts nums[0]
  puts nums[1]
  puts nums[2]
  # Records choice in database
    db = SQLite3::Database.open "test.db"
    db.execute "CREATE TABLE IF NOT EXISTS Cards(choice TEXT)"
    db.execute( "INSERT INTO Cards VALUES ( ? )", *choice )
  i += 1
end
# Pull from database into array

# when we have array from database - add votes
@counts = nums.group_by{|i| i}.map{|k,v| [k, v.count] }

puts @counts


# begin
#     db = SQLite3::Database.open "test.db"
#     db.execute "CREATE TABLE IF NOT EXISTS Cards(Id INTEGER,
#         Nums TEXT)"
#   db.execute "INSERT INTO Cards VALUES(choice)"
#     # db.execute "INSERT INTO Cards VALUES(1, 'nums')"


# rescue SQLite3::Exception => e

#     puts "Exception occured"
#     puts e

# ensure
#     db.close if db
# end

