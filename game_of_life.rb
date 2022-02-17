def create_grid(row, column)
  matriz = {
    'row' => row,
    'column' => column
  }
  grid = ['.', '*']
  grid_template = {}
  matriz['row'].times do |r|
    grid_template[r] = []
    matriz['column'].times do
      random = rand(0..100)
      grid_template[r] << (random > 80 ? grid[1] : grid[0])
    end
  end
  grid_template
end


def show_template(grid)
  grid.each_value { |line| puts line.join }
  puts ""
end

def analyze_grid(grid)
  coord = { row: [], column: [] }
  grid.values.each.with_index do |line, r|
    line.each.with_index do |ch, c|
      if ch == '*'
        coord[:row] << r
        coord[:column] << c
      end
    end
  end
  coord
end

def count_neighbors(coord, grid)
  grid_copy = Marshal.load(Marshal.dump(grid))
  neighbors = 0
  coord[:row].each.with_index do |item, i|
    row = coord[:row][i]
    column = coord[:column][i]
      (neighbors += 1 if (grid[row - 1][column - 1] == '*')) if (row > 0 && column > 0)
      (neighbors += 1 if (grid[row - 1][column] == '*')) if (row > 0)
      (neighbors += 1 if (grid[row - 1][column + 1] == '*')) if (row > 0 && column < grid[0].length - 1)
      (neighbors += 1 if (grid[row][column - 1] == '*')) if (column > 0)
      (neighbors += 1 if (grid[row][column + 1] == '*')) if (column < grid[0].length-1)
      (neighbors += 1 if (grid[row + 1][column - 1] == '*')) if (row < grid.length-1 && column > 0)
      (neighbors += 1 if (grid[row + 1][column + 1] == '*')) if (row < grid.length-1 && column < grid[0].length-1)
      (neighbors += 1 if (grid[row + 1][column] == '*')) if (row < grid.length-1)
      isLive = live_or_die(neighbors)
      grid_copy[row][column] = (isLive ? '*' : '.')      
    print ("#{neighbors}, ")
    neighbors = 0
  end
  show_template(grid_copy)
end

def live_or_die(neighbors)
  (neighbors == 2 || neighbors == 3)
  
end



grid = create_grid(4, 8)

show_template(grid)

count_neighbors(analyze_grid(grid), grid)
