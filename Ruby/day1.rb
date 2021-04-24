puts 'Hello, World!'
puts 'Hello, Ruby'.index('Ruby')
(1..10).step() { puts 'Sergey' }
(1..10).step() {|n| puts "This is sentence number #{n}" }

puts 'Компьютер загадал число от 0 до 9, попробуйте угадать его :)'
guessed = rand(10)
entered = gets.to_i
while guessed != entered
    if guessed < entered
        puts 'Загаданное число меньше'
    else
        puts 'Загаданное число больше'
    end

    entered = gets.to_i
end
puts 'Да, верно! (:'
