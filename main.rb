@matrix = [
    [1,1,1,1],
    [0,1,1,0],
    [0,1,0,1],
    [0,1,0,1],
    [1,1,1,1],
    [1,0,0,0],
    [1,1,1,9]
]

#set starting point
start = {x: 0, y: 0}

#get 2D matrix dimensions
@height = @matrix.size
@width = @matrix.first.size

#checks if node exists and is walkable
def valid? point, path
    point[:x] < @width && point[:y] < @height && point[:x] >= 0 && point[:y] >= 0 && @matrix[point[:y]][point[:x]] != 0 && !path.include?(point)
end

@paths = []

def search_path node, path
    path.push(node)
    if (@matrix[node[:y]][node[:x]] == 9)
        @paths.push(path)
        return
    end
    search_path(left_node(node.clone), path.clone) if valid?(left_node(node.clone), path.clone)
    search_path(right_node(node.clone), path.clone) if valid?(right_node(node.clone), path.clone)
    search_path(above_node(node.clone), path.clone) if valid?(above_node(node.clone), path.clone)
    search_path(below_node(node.clone), path.clone) if valid?(below_node(node.clone), path.clone)
end

#neighbor nodes helper methods 
def left_node node
    node[:x] -= 1
    return node
end

def right_node node
    node[:x] += 1
    return node
end

def above_node node
    node[:y] += 1
    return node
end

def below_node node
    node[:y] -= 1
    return node
end

# begins searching paths
search_path(start, [])

# finds the shortest
shortest_path = @paths.min {|path_a, path_b| path_a.size <=> path_b.size}

# prints the shortest path node by node
puts 'shortest path is'
(shortest_path || []).each do |node|
    puts " -> (#{node[:x]}, #{node[:y]})"
end