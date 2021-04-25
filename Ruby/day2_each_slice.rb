numbers = (1..16).to_a
slice = []
numbers.each do |n|
    slice.push(n)
    if slice.size == 4
        puts slice.to_s
        slice.clear
    end
end

numbers.each_slice(4) { |slice| puts slice.to_s }
