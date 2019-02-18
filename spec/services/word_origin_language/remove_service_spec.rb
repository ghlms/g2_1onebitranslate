require_relative './../../spec_helper.rb'

describe WordOriginLanguageModule::RemoveService do
  describe '#call' do
    context "Valid ID" do
      before do
        word_origin_language = create(:word_origin_language)
        @removeService = WordOriginLanguageModule::RemoveService.new({"id" => word_origin_language.id})
      end

      it "Return success message" do
        response = @removeService.call()
        expect(response).to match("Deletado com sucesso")
      end

      it "Remove palavra from database" do
        expect(WordOriginLanguage.all.count).to eq(1)
        response = @removeService.call()
        expect(WordOriginLanguage.all.count).to eq(0)
      end
    end

    context "Invalid ID" do
      it "return error message" do
        @removeService = WordOriginLanguageModule::RemoveService.new({"id" => rand(1..9999)})
        response = @removeService.call()

        expect(response).to match("Questão inválida, verifique o Id")
      end
    end
  end
end
