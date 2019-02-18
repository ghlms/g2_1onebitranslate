require_relative './../../spec_helper.rb'


describe WordOriginLanguageModule::ListService do
  describe '#call' do
    context "list command" do
      context "Zero translate in database" do
        it "Return don't find message" do
          @listService = WordOriginLanguageModule::ListService.new({}, 'list')

          response = @listService.call()
          expect(response).to match("Nada encontrado")
        end
      end

      context "Two translate in database" do
        it "Find questions and answer in response" do
          @listService = WordOriginLanguageModule::ListService.new({}, 'list')

          word_origin_language1 = create(:word_origin_languages)
          word_origin_language2 = create(:word_origin_languages)

          response = @listService.call()

          expect(response).to match(word_origin_language1.word)
          expect(response).to match(word_origin_language1.language)

          expect(response).to match(word_origin_language2.word)
          expect(response).to match(word_origin_language2.language)
        end
      end
    end

    context "search command" do
      context "Empty query" do
        it "return don't find message" do
          @listService = WordOriginLanguageModule::ListService.new({'query' => ''}, 'search')

          response = @listService.call()
          expect(response).to match("Nada encontrado")
        end
      end

      context "Valid query" do
        it "find question and answer in response" do
          word_origin_language = create(:word_origin_languages)

          @listService = WordOriginLanguageModule::ListService.new({'query' => word_origin_language.question.split(" ").sample}, 'search')

          response = @listService.call()

          expect(response).to match(word_origin_language.word)
          expect(response).to match(word_origin_language.language)
        end
      end
    end

  end
end
