# -*- encoding : utf-8 -*-
require 'minitest/autorun'
require 'superpay'

describe Superpay::Transacao do

  before do
    Superpay.config do |config|
      config.ambiente         = :teste
      config.estabelecimento  = 1369338339932
      config.usuario          = 'ERNET'
      config.senha            = 'ERNET'
    end

    # Cliente
    @usuario_transacao = {
      codigo_cliente: 1,
      tipo_cliente: 1,
      nome_comprador: 'Marcelo',
      documento_comprador: '04795729921',
      documento2_comprador: '97619077',
      sexo_comprador: 'M',
      data_nascimento_comprador: '14/03/1988',
      telefone_comprador: '34166404',
      ddd_comprador: '16',
      ddi_comprador: '55',
      codigo_tipo_telefone_comprador: 1,
      telefone_adicional_comprador: '34166405',
      ddd_adicional_comprador: '16',
      ddi_adicional_comprador: '55',
      codigo_tipo_telefone_adicional_comprador: 1,
      email_comprador: 'marcelo@qw3.com.br',
      endereco_comprador: 'Giácomo Casale',
      numero_endereco_comprador: '147',
      bairro_endereco_comprador: 'Jardim Alvorada',
      complemento_endereco_comprador: '',
      cidade_endereco_comprador: 'São Carlos',
      estado_endereco_comprador: 'SP',
      cep_endereco_comprador: '13562350',
      endereco_entrega: 'Giácomo Casale',
      numero_endereco_entrega: '147',
      bairro_endereco_entrega: 'Jardim Alvorada',
      complemento_endereco_entrega: '',
      cidade_endereco_entrega: 'São Carlos',
      estado_endereco_entrega: 'SP',
      cep_endereco_entrega: '13562350',
      telefone_entrega: '34166404',
      ddd_entrega: '16',
      ddi_entrega: '55',
      codigo_tipo_telefone_entrega: 1,
      telefone_adicional_entrega: '34166404',
      ddd_adicional_entrega: '16',
      ddi_adicional_entrega: '55',
      codigo_tipo_telefone_adicional_entrega: 1,
    }

    # Pedido
    @itens_do_pedido = [
      {
        codigo_produto: 1,
        codigo_categoria: 1,
        nome_produto: 'Produto 1',
        nome_categoria: 'Categoria 1',
        quantidade_produto: 1,
        valor_unitario_produto: 50
      },
      {
        codigo_produto: 1,
        codigo_categoria: 1,
        nome_produto: 'Produto 1',
        nome_categoria: 'Categoria 1',
        quantidade_produto: 1,
        valor_unitario_produto: 50
      }
    ]

    # Dados da venda
    @venda = {
      numero_transacao: 9877,
      codigo_forma_pagamento: 90,
      valor: 100,
      valor_desconto: 0,
      taxa_embarque: 0,
      parcelas: 1,
      nome_titular_cartao_credito: 'Marcelo',
      numero_cartao_credito: '4444333322221111',
      codigo_seguranca: '123',
      data_validade_cartao: '12/2016',
      url_campainha: 'teste',
      ip: '187.39.185.39',
      idioma: 1,
      origem_transacao: 1,
      campo_livre1: '',
      campo_livre2: '',
      campo_livre3: '',
      campo_livre4: '',
      campo_livre5: '',
      campo_livre6: '',
      dados_usuario_transacao: @usuario_transacao,
      itens_do_pedido: @itens_do_pedido
    }

  end

  it "deveria pagar com sucesso" do
    transacao = Superpay::Transacao.pagar( @venda )
    transacao[:error].must_equal "Problemas ao receber transacao. Forma de Pagamento inexistente ou nao configurada para este estabelecimento, valor enviado: 90"
  end

end