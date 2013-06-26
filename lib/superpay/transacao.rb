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
      13 => :cancelada,
      14 => :estornada,
      15 => :em_analise_risco,
      17 => :recusado_analise_risco,
      18 => :falha_envio_analise_risco,
      21 => :boleto_pago_menor,
      22 => :boleto_pago_maior,
      30 => :em_curso,
      31 => :ja_efetuada
    }

    #
    # Faz o pagamento da transação, a partir dos dados do gateway.
    # Se a transação já foi feita, seu status de retorno será 31: ja_efetuada. 
    # Caso deseje saber qual o real status da transação, faça uma consulta.
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

      retorno = Superpay.conector.call(:pagamento_transacao_completa, {transacao: dados})
      resposta = retorno.to_array(:pagamento_transacao_completa_response, :return).first
      # Verifica se a resposta veio correta ou se deu problema
      return {erros: retorno} if !resposta
      # Se o estabelecimento retornado for diferente da configuração, deu coisa errada
      if resposta[:codigo_estabelecimento] != ::Superpay.config.estabelecimento.to_s
        raise "Código do estabelecimento não é o da configuração: #{resposta[:codigo_estabelecimento]}"
      end

      # Sobrecarga com dados tratados e retorna
      return Transacao.tratar_retorno(resposta)
    end

    #
    # Consulta uma transação de acordo com seu número (código).
    def self.consultar(numero_transacao)
      dados = {
        codigo_estabelecimento: ::Superpay.config.estabelecimento,
        numero_transacao: numero_transacao
      }
      retorno = Superpay.conector.call(:consulta_transacao_especifica, {consulta_transacao_w_s: dados})
      resposta = retorno.to_array(:consulta_transacao_especifica_response, :return).first
      # Verifica se a resposta veio correta ou se deu problema
      return {erros: retorno} if !resposta
      # Se o estabelecimento retornado for diferente da configuração, deu coisa errada
      if resposta[:codigo_estabelecimento] != ::Superpay.config.estabelecimento.to_s
        raise "Código do estabelecimento não é o da configuração: #{resposta[:codigo_estabelecimento]}"
      end

      # Sobrecarga com dados tratados e retorna
      return Transacao.tratar_retorno(resposta)
    end

    def self.cancelar(dados)
      raise 'Not implemented yet'
    end

    def self.pagar_com_varios_cartoes(dados)
      raise 'Not implemented yet'
    end

    #
    # Trata o retorno das transações: converte valores e datas para objetos.
    def self.tratar_retorno(transacao)
      transacao[:status] = STATUS[transacao[:status_transacao].to_i]
      transacao[:valor] = Helper.superpay_number_to_decimal(transacao[:valor])
      transacao[:valor_desconto] = Helper.superpay_number_to_decimal(transacao[:valor_desconto]) unless transacao[:valor_desconto].blank?
      transacao[:taxa_embarque] = Helper.superpay_number_to_decimal(transacao[:taxa_embarque]) unless transacao[:taxa_embarque].blank?
      transacao[:data_aprovacao_operadora] = transacao[:data_aprovacao_operadora].to_date unless transacao[:data_aprovacao_operadora].blank?
      return transacao
    end

  end
end
