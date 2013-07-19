# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'alice'
    email { "#{name}@example.com".downcase }
  end

  factory :quote do
    content 'Quote content'
    author
    source 'Quote source'
    context 'Quote context'
    language 'english'
    user

    factory :quote_with_photos do
      ignore do
        photos_count 1
      end

      after(:create) do |quote, evaluator|
        create_list(:photo, evaluator.photos_count, quote: quote)
      end
    end
  end

  factory :author do
    name 'kinopyo'
  end

  factory :identity do
    name 'alice'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :photo do
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'rails.png')) }
  end
end
