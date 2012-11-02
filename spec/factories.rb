Factory.define :user do |user|
  user.name                  "Anastasia Pryachina"
  user.email                 "user@example.net"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :post do |post|
  post.content "Foo bar"
  post.ptitle "bar"
  post.association :user
end