require_relative './../../spec_helper.rb'

describe WordOriginLanguageModule::CreateService do
  before do
    @word_origen = FFaker::Lorem.sentence
    @language_origen = 'en'
    @word_destin = 'traduzido'
    @language_destin = 'pt'
  end


  describe '#call' do
    context "Without hashtag params" do
      it "will receive a error" do
        @createService = WordOriginLanguageModule::CreateService.new({"word" => @word_origen, "language" => @language_origen})
        response = @createService.call()
        expect(response).to match("Word Obrigatória")
      end
    end

    context "With Valid params" do
      before do
        @createService = WordOriginLanguageModule::CreateService.new({"word" => @word_origen, "language" => @language_origen, "language_destin" => @language_destin})
        @response = @createService.call()
      end


      it "Receive success message" do
        expect(@response).to match("Criado com sucesso")
      end


      it "Word is present in database" do
        expect(WordOriginLanguage.last.word).to match(@word_origen)
        expect(WordOriginLanguage.last.language).to match(@language_origen)
      end


      it "Translate are created" do
        expect(@word_destin).to match(WordDestinLanguage.first.word)
        expect(@language_destin).to match(WordDestinLanguage.last.language)
      end
    end
  end
end
