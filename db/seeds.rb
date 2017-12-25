unless User.find_by(role: 'admin')
  admin = User.create!(email: 'admin@mail.com',
               password: 'password',
               password_confirmation: 'password',
               role: 'admin')
  20.times do |i|
    Item.create!(title: "Product ##{i}", price: rand(2.0...10.0).round(2), basket: admin.basket)
  end
end