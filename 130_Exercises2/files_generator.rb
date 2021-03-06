require 'fileutils'

copy_and_paste = <<~NAMES
1 	Classes to Test - Cash Register and Transaction 	completed
2 	Setup the Test Class - Cash Register 	completed
3 	Test Accept Money Method - Cash Register 	completed
4 	Test Change Method - Cash Register 	completed
5 	Test Give Receipt Method - Cash Register 	completed
6 	Test Prompt For Payment Method- Transaction 	completed
7 	Alter Prompt For Payment Method - Transaction 	completed
8 	Swap Letters Sample Text and Starter File 	completed
9 	Test swap method - Text 	completed
10 	Test word_count method - Text 	completed
NAMES

def generate_filenames(heredoc, filetype)
  heredoc
    .split("\n")
    .map do |filename| 
      filename = filename.gsub(/\s+(completed|Not completed)$/, '');
      name_parts = filename.match(/(\d+)\s+(.*)/)
      number = name_parts[1]
      exercise_name = name_parts[2]
      if filetype == '.js'
        camel_case(number, exercise_name, '.js')
      elsif filetype == '.rb'
        snake_case(number, exercise_name, '.rb')
      end
    end.each do |filename| 
      FileUtils.touch(filename)
    end
end

def camel_case(file_number, exercise_name, ext)
  file_number = file_number.to_i < 10 ? "0#{file_number}_" : "#{file_number}_"
  exercise_name = exercise_name.split(' ').map.with_index do |name, index|
    if index == 0
      name.downcase
    else
      name.capitalize
    end
  end.join

  file_number + exercise_name + ext
end

def snake_case(file_number, exercise_name, ext)
  file_number = file_number.to_i < 10 ? "0#{file_number}_" : "#{file_number}_"
  exercise_name = exercise_name.gsub(/\ /, '_').downcase
  file_number + exercise_name + ext
end

file_type = '.rb'
 
generate_filenames(copy_and_paste, file_type)
