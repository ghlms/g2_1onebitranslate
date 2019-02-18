class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      WordOriginLanguageModule::ListService.new(params, action).call()
    when "create"
      WordOriginLanguageModule::CreateService.new(params).call()
    when "remove"
      WordOriginLanguageModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    else
      "Não compreendi o seu desejo"
    end
  end
end
