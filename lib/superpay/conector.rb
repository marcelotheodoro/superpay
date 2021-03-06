module Superpay
  class Conector

    attr_accessor :savon_client

    def initialize
      self.reload
    end

    def reload
      @savon_client = Savon.client do 
        wsdl ::Superpay.config.url
        convert_request_keys_to :lower_camelcase
      end
    end

    def self.instance
      @__instance__ ||= new
    end

    def call(metodo, transacao)
      parametros = {
        usuario: Configuracao.instance.usuario, 
        senha: Configuracao.instance.senha
      }
      @savon_client.call(metodo.to_sym) do
        message parametros.merge(transacao)
      end
    end

  end
end