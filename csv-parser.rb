require 'csv'
# 1. I as a USER want to add/remove/update/read vocabulary
# 2. I as a USER want to be tested,
# meaning asked for the translation of a displayed word.

# 2) to achieve 2, I need:
# csv-data as an array of strings --> done

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'french_verbs.csv'

def quote_data(filepath)
  data_quoted = []
  CSV.foreach(filepath) do |row|
    # I must transform each entry into a string to be able to work with it
    row.map do |col|
      data_quoted << col.split(';')
    end
  end
  data_quoted
end

def display_vocab(filepath)
  all_words = quote_data(filepath)
  all_words.each do |word|
    puts "#{word[0]} | #{word[1]}"
  end
end

display_vocab(filepath)
# def display_vocab
#   formatted_rows = quote_data(filepath)

#   puts formatted_rows
# end
# quote_data.foreach(filepath, csv_options) do |row|
#   puts "#{row['french']} corresponds to: #{row['english']}"
# end

# csv-data displayed in the format: "english: '#{english-word}"
# then I need a gets.chomp for user answer
# if csv-english = csv-french = input-french --> display congratsm, wanna move on?-->
# if user hits "y" ask another question
# if not say "bye"
