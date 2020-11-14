
require 'csv'

class StudentDirectory
  attr_accessor :students

  def initialize
    @students = []
    interactive_menu
  end

  def interactive_menu
    loop do
      puts "  Choose your option >>"
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_menu
    puts "  1. Enter student names and cohorts"
    puts "  2. Print student list"
    puts "  3. Save the current list"
    puts "  4. Load a saved list"
    puts "  9. Exit"
  end

  def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again!"
    end
  end

  def input_students
    while true do
      # prompt the user for the student's name
      puts "Enter the student's name (Enter 'stop' to exit) >> "
      name = gets.chomp
      if name.empty?
        puts "You did not enter a name."
        break
      elsif name.downcase == "stop"
        break
      end

      # prompt the user for the student's cohort
      puts "Enter the student's cohort >>"
      cohort = gets.chomp
      cohort = "n/a" if cohort.empty?
      break if cohort.downcase == "stop"

      # add the student hash to the array
      add_students(name, cohort)

      if @students.count == 1
        puts "Now we have 1 student\n"
      else
        puts "Now we have #{@students.count} students"
      end
    end
  end

  def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
  end

  def show_students
    print_header
    print_students_list
    print_footer
  end

  def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
  end

  def print_students_list
    @students.each_with_index do |student, index|
      puts "#{index + 1} #{student[:name]} (#{student[:cohort]})"
    end
  end

  def print_footer
    puts "Overall, we have #{@students.count} great students\n"
  end

  def save_students
    puts "Saving the current student list..."
    sleep 1

    Dir.mkdir("student_lists") unless Dir.exist? "student_lists"

    puts "Enter the name of your file >>"
    save_file = gets.chomp
    filename = "student_lists/#{save_file}.csv"
    # open the file for writing
    CSV.open(filename, "w") do |csv|
      @students.each do |student|
        csv << [student[:name], student[:cohort]]
      end
    end

    puts "Successfully saved."
    sleep 1
  end

  def load_students(filename = "students.csv")
    @students = []
    unless Dir.exist?("student_lists")
      puts "No saved lists. Redirecting to the main menu..."
      sleep 1
      interactive_menu
    end

    puts saved_lists

    puts "Enter which list you want to load >>"

    load_list = gets.chomp

    filename = "student_lists/#{load_list}.csv"

    unless File.exist? (filename)
      puts "The file does not exist."
      exit
    end

    CSV.foreach(filename) do |row|
      name = row[0]
      cohort = row[1]
      add_students(name, cohort)
    end

    puts "Successfully loaded the student list."
    sleep 1
  end

  def saved_lists
    puts "Saved student lists: "
    Dir["./student_lists/*"].map{ |file| file.split('/')[-1].split('.')[0]}
  end
end
