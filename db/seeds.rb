# coding: utf-8
# Create test user
identity = Identity.create(name: 'foobar', email: 'email@example.com', password: '1234567')
provider = Provider.create(provider: 'identity', uid: identity.id)
user = provider.create_user(name: 'foobar', email: 'email@example.com')

# Create quotes
quotes = [
  { name: "Albert Einstein", source: "", content: "Insanity: doing the same thing over and over again and expecting different results." },
  { name: "ゾロ", source: "ワンピース", content: "三本でもおれとお前の剣の、一本の重みは同じじゃねェよ!!!!!" },
  { name: "张爱玲", source: "十八春", content: "日子过得真快，尤其对于中年以后的人，十年八年都好象是指顾间的事。可是对于年轻人，三年五载就可以是一生一世。" },
]
quotes.each do |quote|
  user.quotes.create!(name: quote[:name], source: quote[:source], content: quote[:content])
end
