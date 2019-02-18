require_relative './../spec_helper.rb'

describe HelpService do
  describe '#call' do
    it "Response have the main commands" do
      response = HelpService.call()
      expect(response).to match('help')
      expect(response).to match('Adicione uma Tradução')
      expect(response).to match('Remova ID')
      expect(response).to match('Como se fala X em inglês')
      expect(response).to match('Significado de X')
      expect(response).to match('Perguntas e Respostas')
    end
  end
end
