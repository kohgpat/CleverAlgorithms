# Ant System in the Ruby Programming Language

# The Clever Algorithms Project: http://www.CleverAlgorithms.com
# (c) Copyright 2010 Jason Brownlee. Some Rights Reserved. 
# This work is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 2.5 Australia License.

def euc_2d(c1, c2)
  Math::sqrt((c1[0] - c2[0])**2.0 + (c1[1] - c2[1])**2.0).round
end

def cost(permutation, cities)
  distance =0
  permutation.each_with_index do |c1, i|
    c2 = (i==permutation.length-1) ? permutation[0] : permutation[i+1]
    distance += euc_2d(cities[c1], cities[c2])
  end
  return distance
end

def initialise_pheromone_matrix(num_cities, basic_score)
  v = num_cities.to_f / basic_score
  return Array.new(num_cities){|i| Array.new(num_cities, v)}
end

def nearest_neighbor_solution(cities)
  candidate = {}
  candidate[:vector] = [rand(cities.length)]
  all_cities = Array.new(cities.length) {|i| i}
  while candidate[:vector].length < cities.length
    next_city = {:city=>nil,:dist=>nil}
    candidates = all_cities - candidate[:vector]
    candidates.each do |city|
      dist = euc_2d(cities[candidate[:vector].last], city)
      if next_city[:city].nil? or next_city[:dist] < dist
        next_city[:city] = city
        next_city[:dist] = dist
      end
    end
    candidate[:vector] << next_city[:city]
  end
  candidate[:cost] = cost(candidate[:vector], cities)
  puts "NN cost=#{candidate[:cost]}"
  return candidate
end

def search(cities, max_iterations)
  best = nearest_neighbor_solution(cities)
  pheromone = initialise_pheromone_matrix(cities.length, best[:cost])
  
  max_iterations.times do |iter|
    
    # best = candidate if best.nil? or candidate[:cost] < best[:cost]
    # puts " > iteration #{(iter+1)}, best=#{best[:cost]}"
  end
  return best
end

if __FILE__ == $0
  berlin52 = [[565,575],[25,185],[345,750],[945,685],[845,655],[880,660],[25,230],
   [525,1000],[580,1175],[650,1130],[1605,620],[1220,580],[1465,200],[1530,5],
   [845,680],[725,370],[145,665],[415,635],[510,875],[560,365],[300,465],
   [520,585],[480,415],[835,625],[975,580],[1215,245],[1320,315],[1250,400],
   [660,180],[410,250],[420,555],[575,665],[1150,1160],[700,580],[685,595],
   [685,610],[770,610],[795,645],[720,635],[760,650],[475,960],[95,260],
   [875,920],[700,500],[555,815],[830,485],[1170,65],[830,610],[605,625],
   [595,360],[1340,725],[1740,245]]
  max_iterations = 200

   best = search(berlin52, max_iterations)
   puts "Done. Best Solution: c=#{best[:cost]}, v=#{best[:vector].inspect}"
end