# -*- encoding : utf-8 -*-
module Superpay
  class Transacao

    # CONSTANTES
    IDIOMAS = {portugues: 1, ingles: 2, espanhol: 3}
    STATUS = {
      1 => :autorizado_confirmado,
      2 => :autorizado,
      3 => :nao_autorizado,
      5 => :em_andamento,
      6 => :boleto_em_compensacao,
      8 => :aguardando_pagamento,
      9 => :falha_na_operadora,
      15 => :em_analise_risco,
      17 => :recusado_analise_risco,
      18 => :falha_envio_analise_risco,
      21 => :boleto_pago_menor,
      22 => :boleto_pago_maior,
      30 => :operacao_em_andamento,
      31 => :ja_efetuada
    }

    def self.pagar(dados)
      # Valida os dados passados
      raise 'Campo obrigatório: numero_transacao' if dados[:numero_transacao].blank?
      raise 'Campo obrigatório: codigo_forma_pagamento' if dados[:codigo_forma_pagamento].blank?
      raise 'Campo obrigatório: valor' if dados[:valor].blank?
      raise 'Campo obrigatório: nome_titular_cartao_credito' if dados[:nome_titular_cartao_credito].blank?
      raise 'Campo obrigatório: numero_cartao_credito' if dados[:numero_cartao_credito].blank?
      raise 'Campo obrigatório: codigo_seguranca' if dados[:codigo_seguranca].blank?
      raise 'Campo obrigatório: data_validade_cartao' if dados[:data_validade_cartao].blank?
      raise 'Campo obrigatório: dados_usuario_transacao' if dados[:dados_usuario_transacao].blank?
      raise 'Campo obrigatório: itens_do_pedido' if dados[:itens_do_pedido].blank?

      # Sobrecarga com dados default
      dados[:codigo_estabelecimento] = ::Superpay.config.estabelecimento

      retorno = Superpay.conector.call(:pagamento_transacao_completa, dados)
      resposta = retorno.to_array(:pagamento_transacao_completa_response, :return).first
      # Verifica se a resposta veio correta ou se deu problema
      return {erros: retorno} if !resposta
      # Se o estabelecimento retornado for diferente da configuração, deu coisa errada
      if resposta[:codigo_estabelecimento] != ::Superpay.config.estabelecimento.to_s
        raise "Código do estabelecimento não é o da configuração: #{resposta[:codigo_estabelecimento]}"
      end

      # Sobrecarga com dados tratados
      resposta[:status] = STATUS[resposta[:status_transacao].to_i]
      resposta[:valor] = Helper.superpay_number_to_decimal(resposta[:valor])
      resposta[:valor_desconto] = Helper.superpay_number_to_decimal(resposta[:valor_desconto]) unless resposta[:valor_desconto].blank?
      resposta[:taxa_embarque] = Helper.superpay_number_to_decimal(resposta[:taxa_embarque]) unless resposta[:taxa_embarque].blank?
      # resposta[:data] = resposta[:data].to_date

      return resposta
    end

    def self.consultar(dados)
      raise 'Not implemented yet'
    end

    def self.cancelar(dados)
      raise 'Not implemented yet'
    end

    def self.pagar_com_varios_cartoes(dados)
      raise 'Not implemented yet'
    end

  end
end
