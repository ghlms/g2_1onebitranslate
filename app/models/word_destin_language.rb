class WordDestinLanguage < ActiveRecord::Base
    validates_presence_of :language, :word
    has_many :key_word_languages
    has_many :word_origin_languages, through: :key_word_languages
end
