module WordOriginLanguageModule
  class CreateService
    def initialize(params)
      @word_origen = params["word_origen"]
      @language_origen = params["language_origen"]
      @word_destin = params["word_destin"]
      @language_destin = params["language_destin"]
    end


    def call
      return 'Tradução Obrigatória' if @word_destin == nil
      WordOriginLanguage.transaction do
        word_origin_language = WordOriginLanguage.create(word: @language_origen, language: @language_origen)
        word_destin_language = WordDestinLanguage.find_or_create_by(word: @word_destin, language: @language_destin)
      end
      "Criado com sucesso"
    end
  end
end
