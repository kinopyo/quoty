# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'kinopyo'
    email { "#{name}@example.com".downcase }
  end

  factory :quote do
    content 'Quote content'
    name 'Quote author'
    source 'Quote source'
    user
  end
end
