# let's put all students into an array
# students =[
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Baratheon", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp
  end

  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  puts "Students with numbers"
  students.each_with_index do |student, index|
    # students with number
    puts "* #{index + 1} #{student[:name]} (#{student[:cohort]})"
  end

  # only print the students whose name begins with a specific letter.
  puts "Students whose name start with D: "
  students.each do |student|
    if student[:name].chr == "D"
      puts "* #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  # only print the students whose name is shorter than 12 characters.
  puts "Students whose name is shorter than 12 characters: "
  students.each do |student|
    if student[:name].length < 12
      puts "* #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happns until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
