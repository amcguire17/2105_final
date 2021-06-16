class Train
  attr_reader :name, :type, :cargo

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, count)
    @cargo[car] += count
  end

  def weight
    @cargo.sum do |car, count|
      car.weight * count
    end
  end

  def unload_car(car, amount)
    @cargo[car] -= amount
  end
end
