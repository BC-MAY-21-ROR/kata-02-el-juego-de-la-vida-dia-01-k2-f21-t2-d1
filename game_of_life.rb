# Primero ingresar datos
# text = <<TEXT
# ........
# ....*...
# ...**...
# ........
def create_grid(row, column)
    matriz = {
        'row' => row,
        'column' => column
    }
    grid= %w{. *}
    grid_template = Hash.new
    matriz['row'].times do |r|
        # puts "#{grid[rand(0..1)] * matriz['column']}"
        grid_template[r] =[] 
        matriz['column'].times do |c|
            random = rand(0..100)
            if random > 80
                grid_template[r] << grid[1]
                # grid_template += grid[1]
            else
                grid_template[r] << grid[0]
                # grid_template += grid[0]
            end
        end
    end
    grid_template
end

def show_template (grid)
    grid.values.each { |line|
        puts line.join
    }
end

def analyze_grid(grid)
    coord = {
        row: [],
        column:[]
    }
    grid.values.each.with_index() do |line,r|
        line.each.with_index() do |ch, c|
            if ch == "*"
                coord[:row] << r
                coord[:column] << c
            end
        end
    end
    puts coord.inspect
end

grid = create_grid(4,8)

show_template(grid)
analyze_grid(grid)

# TEXT
#Co-authored-by: brocha05 <brocha_05@hotmail.com>
# <2 vecinos muere
# >3 vecinos muere
# == 2 || == 3 vecinos vive en la siguiente generación
# 