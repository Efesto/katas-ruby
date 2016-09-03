
class FishEatsFish

  def self.solution(fishes, directions)

    biggest_fish_index = fishes.index(fishes.max)
    biggest_fish_direction = directions[biggest_fish_index]

    if biggest_fish_direction == 0
      potential_dead_fishes = directions[0, biggest_fish_index]
      living_fishes = fishes[biggest_fish_index +1, fishes.length]
      living_fishes_directions = directions[biggest_fish_index +1, fishes.length]
    else
      potential_dead_fishes = directions[biggest_fish_index + 1, directions.length]
      living_fishes = fishes[0, biggest_fish_index]
      living_fishes_directions = directions[0, biggest_fish_index]
    end

    dead_fishes = potential_dead_fishes.select { |direction| direction != biggest_fish_direction}

    fishes.length - dead_fishes.length + (solution(living_fishes, living_fishes_directions) if living_fishes.count > 1)
  end
end