FactoryBot.define do
  factory :word_destin_language do
    word { FFaker::Lorem.word }
    language {'pt'}
  end
end
