class TextAnalyzer
  def process
    file = File.open("02_sample_text.txt", "r")
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process{|text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process{|text| puts "#{text.split("\n").count} lines"}
analyzer.process{|text| puts "#{text.split(" ").count} words"}

=begin
3 paragraphs
15 lines
126 words
=end