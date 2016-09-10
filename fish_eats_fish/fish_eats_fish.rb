require_relative 'fish'

class FishEatsFish
  class << self
    def survivors(fishes)
      return fishes if fishes.length <= 1

      biggest_fish = fishes.max_by(&:size)
      biggest_fish_index = fishes.index(biggest_fish)

      living_fishes = []

      if biggest_fish.direction.zero?
        survivors = fishes_going_in_direction(
          fishes[biggest_fish_index, fishes.length],
          biggest_fish.direction
        )

        living_fishes = survivors(fishes[0, biggest_fish_index])
        living_fishes << survivors
      else
        survivors = fishes_going_in_direction(
          fishes[0, biggest_fish_index + 1],
          biggest_fish.direction
        )

        living_fishes = survivors
        living_fishes << survivors(fishes[biggest_fish_index + 1, fishes.length])
      end

      living_fishes.flatten
    end

    private

    def fishes_going_in_direction(fishes, fish_direction)
      living_fishes = []
      fishes.each do |fish|
        living_fishes << fish if fish.direction == fish_direction
      end

      living_fishes
    end
  end
end
