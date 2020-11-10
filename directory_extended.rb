# Our code only works with the student name and cohort.
# Add more information: hobbies, country of birth, height, etc.
# In the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort?
# What if one of the values is empty?
# Can you supply a default value?
# The input will be given to you as a string?
# How will you convert it to a symbol? What if the user makes a typo?

def input_students
  # get the first name
  students = []

  while true do
    puts "Enter stop to exit."
    puts "Please enter the first name of the student: "
    name = gets.chomp
    if name.empty?
      puts "You did not enter a name."
      break
    elsif name.downcase == "stop"
      break
    end
    puts "Please enter the cohort of the student: "
    # get the cohort
    cohort = gets.chomp
    if cohort.empty?
      cohort = "tbc"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
  end

  students
end

# Once you complete the previous exercise,
# change the way the users are displayed: print them grouped by cohorts.
# To do this, you'll need to get a list of all existing cohorts
# (the map() method may be useful but it's not the only option),
# iterate over it and only print the students from that cohort.
students =[
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Baratheon", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_by_cohort(students)
  # create an empty array
  students_by_cohort = {}
  student_number = students.length - 1

  while student_number >= 0 do
    name = students[student_number][:name]
    cohort = students[student_number][:cohort]

    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = [name]
    else
      students_by_cohort[cohort].push(name)
    end

    student_number -= 1
  end

  puts "Enter which cohort to display: "

  input = gets.chomp.downcase

  puts students_by_cohort[input.to_sym]
end

print_by_cohort(students)
