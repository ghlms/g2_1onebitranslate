module WordOriginLanguageModule
  class RemoveService
    def initialize(params)
      @params = params
      @id = params["id"]
    end

    def call
      word_origin_language = WordOriginLanguage.where(id: @id).last
      return "Questão inválida, verifique o Id" if word_origin_language == nil

      WordOriginLanguage.transaction do
        # Deleta as tags associadas que não estejam associadas a outros faqs
        word_origin_language.word_destin_languages.each do |h|
          if h.word_origin_languages.count <= 1
            h.delete
          end
        end
        word_origin_language.delete
        "Deletado com sucesso"
      end
    end
  end
end
