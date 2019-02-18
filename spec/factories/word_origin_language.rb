FactoryBot.define do
  factory :word_origin_language do
    word { FFaker::Lorem.word }
    language {'en'}
  end
end
