# frozen_string_literal: true

c1 = Diary.create!({ title: Faker::Book.title, expiration: Faker::Date.forward(days: 10), kind: rand(0..1) })
c2 = Diary.create!({ title: Faker::Book.title, expiration: Faker::Date.forward(days: 10), kind: rand(0..1) })

c1.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c1.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c1.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c1.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c1.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c2.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c2.notes.create({ text: Faker::Books::Lovecraft.paragraph })
c2.notes.create({ text: Faker::Books::Lovecraft.paragraph })
