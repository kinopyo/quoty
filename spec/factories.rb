# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'alice'
    email { "#{name}@example.com".downcase }
  end

  factory :quote do
    content 'Quote content'
    author 'Quote author'
    source 'Quote source'
    context 'Quote context'
    language 'english'
    user
  end

  factory :identity do
    name 'alice'
    password 'foobar'
  end
end
