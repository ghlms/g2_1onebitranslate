class KeyWordLanguage < ActiveRecord::Base
    validates_presence_of :word_origin_language_id, :word_destin_language_id

    belongs_to :word_origin_language
    belongs_to :word_destin_language
end
