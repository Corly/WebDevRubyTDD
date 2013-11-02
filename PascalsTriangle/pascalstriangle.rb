def compute_row(n)
	
	if !(n.is_a? Integer)
		return nil
	end

	pascal_triangle = Array.new(n){Array.new(n)}
	for i in 0..(n-1)
		for j in 0..i
			if j == 0 || j == i
				pascal_triangle[i][j] = 1
			else
				pascal_triangle[i][j] = pascal_triangle[i-1][j] + 
						pascal_triangle[i-1][j-1]
			end
		end
	end

	return pascal_triangle[n-1]
end

