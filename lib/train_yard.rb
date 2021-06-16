class TrainYard
  attr_reader :location, :trains

  def initialize(info)
    @location = info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    types = @trains.map do |train|
      train.type
    end.uniq
    types.sort
  end

  def trains_containing(car)
    @trains.select do |train|
      train.cargo.include?(car)
    end
  end

  def sorted_cargo_list
    cargo_list = []
    @trains.each do |train|
      train.cargo.each do |car, amount|
        cargo_list << car.type
      end
    end
    cargo_list.uniq.sort
  end

  def total_inventory
    inventory = Hash.new(0)
    @trains.each do |train|
      train.cargo.each do |car, amount|
        inventory[car] += amount
      end
    end
    inventory
  end

  def cars_more_than_10
    list = total_inventory.select do |car, amount|
      amount > 10
    end
    list.keys
  end

  def overflow_cars
    cars_more_than_10.select do |car|
      trains_containing(car).length > 1
    end
  end
end
