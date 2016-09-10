class FishEatsFish
  class << self
    def survivors(fishes, directions)
      return fishes if fishes.length <= 1

      biggest_fish_index = fishes.index(fishes.max)
      biggest_fish_direction = directions[biggest_fish_index]

      living_fishes = []

      if biggest_fish_direction.zero?
        survivors = fishes_going_in_direction(
          fishes[biggest_fish_index, fishes.length],
          directions[biggest_fish_index, fishes.length],
          biggest_fish_direction
        )

        living_fishes = survivors(fishes[0, biggest_fish_index], directions[0, biggest_fish_index])
        living_fishes << survivors
      else
        survivors = fishes_going_in_direction(
          fishes[0, biggest_fish_index + 1],
          directions[0, biggest_fish_index + 1],
          biggest_fish_direction
        )

        living_fishes = survivors
        living_fishes << survivors(fishes[biggest_fish_index + 1, fishes.length], directions[biggest_fish_index + 1, fishes.length])
      end

      living_fishes.flatten
    end

    private

    def fishes_going_in_direction(fishes, directions, fish_direction)
      living_fishes = []
      directions.each_with_index do |direction, index|
        living_fishes << fishes[index] if direction == fish_direction
      end

      living_fishes
    end
  end
end
