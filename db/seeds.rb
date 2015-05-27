Product.create!(name: 'Tea 1', description: 'Lorem ipsum', price: 1.03)
Product.create!(name: 'Tea 2', description: 'Lorem ipsum dolor', price: 2.15)
Product.create!(name: 'Tea 3', description: 'Lorem ipsum dolor sit', price: 2.0)
Product.create!(name: 'Coffee 1', description: 'Lorem', price: 1.1)
Product.create!(name: 'Coffee 2', description: 'Lorem ipsum dolor sit amet', price: 33.1)
Product.create!(name: 'Some coffee', description: 'Lorem ipsum', price: 15.5)

Discount.create!(product: Product.first, product_qty: 2, discount_amount: 50, discount_operation: 1)
Discount.create!(product: Product.last, product_qty: 2, discount_amount: 20, discount_operation: 0)