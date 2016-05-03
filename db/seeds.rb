# coding: utf-8
User.create!(name:  "hiro",
             email: "hiro@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

Tag.create!(user_id: 1,
            name: "Ruby")

Tag.create!(user_id: 2,
            name: "Haskell")

Tag.create!(user_id: 3,
            name: "all")

Book.create!(user_id: 1,
             asin: "asin",
             title: "たのしいRuby 第5版",
             author: "高橋 征義",
             publisher: "SBクリエイティブ",
             image: "http://ecx.images-amazon.com/images/I/51XdQhacD-L._SL160_.jpg"
            )

Book.create!(user_id: 1,
             asin: "asin",
             title: "すごいHaskellたのしく学ぼう!",
             author: "Miran Lipovača",
             publisher: "オーム社",
             image: "http://ecx.images-amazon.com/images/I/51P6NdS4IGL._SL160_.jpg"
            )


Booktag.create!(book_id: 1,
                tag_id: 1)

Booktag.create!(book_id: 1,
                tag_id: 4)

Booktag.create!(book_id: 2,
                tag_id: 1)

Booktag.create!(book_id: 2,
                tag_id: 2)
