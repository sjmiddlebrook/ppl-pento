alias Pento.Catalog

products = [
  %{
    name: "Chess",
    description: "A game of strategy",
    sku: 5_678_910,
    unit_price: 10.00
  },
  %{
    name: "Tic-Tac-Toe",
    description: "The game of Xs and Os",
    sku: 1_234_567,
    unit_price: 5.00
  },
  %{
    name: "Table Tennis",
    description: "A game of reflexes",
    sku: 9_876_543,
    unit_price: 15.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)
