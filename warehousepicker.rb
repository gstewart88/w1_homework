require 'pry-byebug'

def product_and_bay
  {'a10' => 'rubber band', 'a9' => 'glow stick', 'a8' => 'model car', 'a7' => 'bookmark', 'a6' => 'shovel', 'a5' => 'rubber duck', 'a4' => 'hanger', 'a3' => 'blouse', 'a2' => 'stop sign', 'a1' => 'needle', 'b1' => 'tire swing', 'b2' => 'sharpie', 'b3' => 'picture frame', 'b4' => 'photo album', 'b5' => 'nail filer', 'b6' => 'toothpaste', 'b7' => 'bath fizzers', 'b8' => 'tissue box', 'b9' => 'deodorant', 'b10' => 'cookie jar', 'c1' => 'rusty nail', 'c2' => 'drill press', 'c3' => 'chalk', 'c4' => 'word search', 'c5' => 'thermometer', 'c6' => 'face wash', 'c7' => 'paint brush', 'c8' => 'candy wrapper', 'c9' => 'shoe lace', 'c10' => 'leg warmers'
  }
end

def bay
  ['a10', 'a9', 'a8', 'a7', 'a6', 'a5', 'a4', 'a3', 'a2', 'a1', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9', 'c10', 'b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 'b9', 'b10'
  ]
end

def menu
  puts `clear` 
  puts "*** Warehouse Picker ***"
  print "Please choose whether to find (p)roducts or (b)ays or just (q)uit "
  gets.chomp.downcase
end

def return_to_main
puts "Press enter to continue"
gets
end

def bays_to_products
  puts "\nWhich bays do you need (press 's' to stop): #{product_and_bay.keys.join(', ')}? "
  bay_choice = gets.chomp.to_s
  choices = [bay_choice]
  choices_i = [bay.index(bay_choice)]
  choices_v = [product_and_bay[bay_choice]]
  until bay_choice == 's' do
    bay_choice = gets.chomp.to_s
    choices << bay_choice 
    choices_i << bay.index(bay_choice)
    choices_v << [product_and_bay[bay_choice]]
  end
  choices.pop
  puts "Your are visiting bays #{choices} .\n\n"
  choices_v.pop
  puts "You are looking for the following items: #{choices_v.join(', ')}"
  choices_i.pop
  choices_i.sort!
  puts "Your trip length is #{choices_i.last - choices_i.first} steps.\n\n"
  puts "You should visit them in the order #{bay[choices_i.join(', ')]}"
  return_to_main
end


def products_to_bays
  puts "\nWhich products do you need (press 's' to stop): #{product_and_bay.values.join(', ')}? "
  product_choice = gets.chomp.to_s
  choices = [product_and_bay.key(product_choice)]
  choices_i = [bay.index(product_and_bay.key(product_choice))]
  choices_v = [product_choice]
  until product_choice == 's' do
    product_choice = gets.chomp.to_s
    choices << product_and_bay.key(product_choice)
    choices_i << bay.index(product_and_bay.key(product_choice))
    choices_v << product_choice
  end
  choices.pop
  choices_v.pop
  choices_i.pop
  choices_i.sort!
  puts "You are looking for the following items: #{choices_v.join(', ')}"
  puts "Your are visiting bays #{choices} .\n\n"
  puts "Your trip length is #{choices_i.last - choices_i.first} steps.\n\n"
  puts "You should visit them in the order: \n\n"
  until choices_i.empty?
  puts "#{bay[choices_i.first]}"
  choices_i.shift
  end

  return_to_main
end

response = menu

until response == 'q'
  case response
  when 'b'
    bays_to_products
  when 'p'
    products_to_bays
  else
    puts "Please use b or p to choose an option, or press q to quit "
    return_to_main
  end
  response = menu
end