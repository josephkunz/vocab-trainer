require 'csv'
# 1. I as a USER want to add/remove/update/read vocabulary
# 2. I as a USER want to be tested,
# meaning asked for the translation of a displayed word.

# 1. I want to DISPLAY all vocabulary.

filepath = 'french_verbs.csv'

def quote_data(filepath)
  # empty array to store all quoted data
  data_quoted = []
  # Should "quote" all data and push to an empty array
  CSV.foreach(filepath) do |row|
    row.map do |col|
      data_quoted << col.split(';')
    end
  end
  data_quoted
end

def display_vocab(filepath)
  all_words = quote_data(filepath)
  all_words.each_with_index do |word, index|
    puts "#{index + 1}. FR: #{word[0]} | ENG: #{word[1]}."
  end
end

display_vocab(filepath)

# 2. I want to ADD vocabulary to the list
csv_options = { col_sep: ';'}

def add_words(filepath, csv_options)
  # receives user input and stores it in two respective variables.
  # side-note: opted for unquoted-writing because excel does the same thing.
  # =>  Using quote_data function to quote retroactively.
  puts "What word would you like to add? Please provide the french, followed by the english translation "
  french_word = gets.chomp
  english_word = gets.chomp

  CSV.open(filepath, 'a+', csv_options) do |csv|
    csv << [french_word, english_word]
  end
end
add_words(filepath, csv_options)

# csv-data displayed in the format: "english: '#{english-word}"
# then I need a gets.chomp for user answer
# if csv-english = csv-french = input-french --> display congratsm, wanna move on?-->
# if user hits "y" ask another question
# if not say "bye"
