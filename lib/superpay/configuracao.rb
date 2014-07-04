# -*- encoding : utf-8 -*-
module Superpay

  class Configuracao

    attr_accessor :ambiente, :estabelecimento, :usuario, :senha

    def self.instance
      @__instance__ ||= new
    end

    def url
      if ambiente_producao?
        return 'https://superpay2.superpay.com.br/checkout/servicosPagamentoCompletoWS.Services?wsdl'
      else
        return 'https://homologacao.superpay.com.br/superpay/servicosPagamentoCompletoWS.Services?wsdl'
      end
    end

    def ambiente_teste?
      !ambiente_producao?
    end

    def ambiente_producao?
      return (ambiente.to_sym == :producao) if !ambiente.blank?
      return true
    end

  end

end
