require "pg_search"

class WordOriginLanguage < ActiveRecord::Base
    include PgSearch
    validates_presence_of :language, :word
    has_many :key_word_languages
    has_many :word_destin_languages, through: :key_word_languages

    # include PgSearch
    pg_search_scope :search, :against => [:language, :word]
end
