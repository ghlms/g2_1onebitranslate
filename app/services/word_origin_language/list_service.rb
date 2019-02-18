module WordOriginLanguageModule
  class ListService
    def initialize(params, action)
      @action = action
      @query = params["query"]
    end


    def call
      if @action == "search"
        word_origin_languages = WordOriginLanguage.search(@query)
      elsif @action == "search_by_traducao"
        word_origin_languages = []
        WordOriginLanguage.all.each do |word_origin_language|
          word_origin_languages.word_destin_languages.each do |traducao|
            word_origin_languages << word_origin_language if traducao.word == @query
          end
        end
      else
        word_origin_languages = WordOriginLanguage.all
      end

      response = "*Palavras a traduzidas* \n\n"
      word_origin_languages.each do |f|
        response += "*#{f.id}* - "
        response += "*#{f.word}*\n"
        response += "#{f.language} \n"
        f.word_destin_languages.each do |h|
          response += "_##{h.word}_ "
          response += "_##{h.language}_ "
        end
        response += "\n\n"
      end
      (word_origin_languages.count > 0)? response : "Nada encontrado"
    end
  end
end
