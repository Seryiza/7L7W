filename = 'day1.rb'
phrase = 'число'

File.open(filename) do |file|
    file.each {|line| puts "#{file.lineno}: #{line}" if line.include? phrase}
end
