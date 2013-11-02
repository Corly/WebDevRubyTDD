require 'set'

class Cell < Struct.new(:x, :y)
	
	def is_neighbor(cell)
		return (x - cell.x).abs <= 1 && (y - cell.y).abs <= 1 
	end

end

def evolve_universe(seed)
	if seed == [].to_set || seed == [Cell.new(0,0)].to_set
		return [].to_set
	end

	array_seed = seed.to_a
	new_gen_array = []

	max_x = -1;
	max_y = -1;
	min_x = 1000;
	min_y = 1000;
	for i in 0..(array_seed.length - 1)
		if array_seed[i].x > max_x 
			max_x = array_seed[i].x
		end
		if array_seed[i].x < min_x
			min_x = array_seed[i].x
		end
		if array_seed[i].y > max_y
			max_y = array_seed[i].y
		end
		if array_seed[i].y < min_y
			min_y = array_seed[i].y
		end
	end

	number_of_neighbours = 0
	for i in min_x-1..max_x+1
		for j in min_y-1..max_y+1
			number_of_neighbours = 0
			for k in 0..(array_seed.length - 1)
				if array_seed[k].x == i && array_seed[k].y == j
					break
				end
				
				if array_seed[k].is_neighbor(Cell.new(i,j))
					number_of_neighbours += 1
				end
			end

			if number_of_neighbours == 3
				new_gen_array << Cell.new(i,j)
			end
		end
	end

	number_of_neighbours = 0
	for i in 0..(array_seed.length - 1)
		for j in 0..(array_seed.length - 1)
			if (i != j)
				if (array_seed[i].is_neighbor(array_seed[j]))
					number_of_neighbours += 1
				end
			end
		end

		if (number_of_neighbours < 2)
			#moare subpopulat
		elsif number_of_neighbours == 2 || number_of_neighbours == 3
			new_gen_array << array_seed[i]
		elsif number_of_neighbours > 3
			#moare suprapopulat
		else
			#nimic
		end
		number_of_neighbours = 0
	end

	return new_gen_array.to_set

end

