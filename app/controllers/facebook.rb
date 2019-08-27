
100.times do
	num = 1
	if (num % 3) == 0
		puts face
	elsif (num % 5) == 0
		puts book
	elsif (num % 3) == 0 && (num % 5) == 0
		puts facebook
	else
		puts num
	end
	num = num + 1
end