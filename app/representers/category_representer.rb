class CategoryRepresenter
  #This is our own custom helper that we will use to render the json response just the way we want it

  def initialize(category)
    @category = category
  end

  def as_json
    {
      id: category.id,
      name: category.name
    }
  end

  private
  attr_reader :category

end
  