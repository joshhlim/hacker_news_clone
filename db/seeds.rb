categories = ['Furniture', 'Automobiles', 'Bicycles', 'Electronics', 'Sporting Goods']
categories.each do |category|
  Category.create(name: category)
end
