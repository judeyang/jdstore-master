# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "jude@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.cart = Cart.new
u.save

#zhuozhi 增加批量上传图片功能,
f_title =[“pc1”,”pc2”,”pc3”,”pc4”,”pc5”]
f_images =[]
For i in 0..5 do
Product.create！（
title:f_title[i],
description:"摄影课",
quantity:100,
price:rand(10..50),
image: open(f_images[i]))
end

for i in 0..5 do
  Photo.create!(product_id: (i+1) ,avatar:open(image1s [i]))
  Photo.create!(product_id: (i+2) ,avatar:open(image2s [i]))
end
