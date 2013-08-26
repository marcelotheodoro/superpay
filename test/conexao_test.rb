# # -*- encoding : utf-8 -*-
# require 'minitest/autorun'
# require 'superpay'

# describe Superpay::Configuracao do

#   before do
#     @client = Savon.client do 
#       wsdl 'http://homologacao2.superpay.com.br/checkout/servicosPagamentoCompletoWS.Services?wsdl'
#       convert_request_keys_to :lower_camelcase
#     end
#   end
  
#   describe "teste de requisicao" do
#     it "deveria reconhecer as operações" do 
#       @client.operations.must_equal [:consulta_transacao_especifica, :pagamento_transacao_completa, :operacao_transacao, :visualizar_dados_retorno, :pagamento_transacao_completa_mais_cartoes_credito, :cancelar_transacao_completa, :capturar_transacao_completa, :refazer_transacao, :altera_numero_pedido, :salva_hash_pagamento, :bloquear_transacao, :consulta_bloqueio_transacao, :atualiza_campos_livres]
#     end
#   end

#   describe "pagamento de transação" do
#     it "deveria criar uma requisição" do

#       # dados de homologação
#       usuario = 'ERNET'
#       senha   = 'ERNET'

#       # Cliente
#       usuario_transacao = {
#         codigo_cliente: 1,
#         tipo_cliente: 1,
#         nome_comprador: 'Marcelo',
#         documento_comprador: '04795729921',
#         documento2_comprador: '97619077',
#         sexo_comprador: 'M',
#         data_nascimento_comprador: '14/03/1988',
#         telefone_comprador: '34166404',
#         ddd_comprador: '16',
#         ddi_comprador: '55',
#         codigo_tipo_telefone_comprador: 1,
#         telefone_adicional_comprador: '34166405',
#         ddd_adicional_comprador: '16',
#         ddi_adicional_comprador: '55',
#         codigo_tipo_telefone_adicional_comprador: 1,
#         email_comprador: 'marcelo@qw3.com.br',
#         endereco_comprador: 'Giácomo Casale',
#         numero_endereco_comprador: '147',
#         bairro_endereco_comprador: 'Jardim Alvorada',
#         complemento_endereco_comprador: '',
#         cidade_endereco_comprador: 'São Carlos',
#         estado_endereco_comprador: 'SP',
#         cep_endereco_comprador: '13562350',
#         endereco_entrega: 'Giácomo Casale',
#         numero_endereco_entrega: '147',
#         bairro_endereco_entrega: 'Jardim Alvorada',
#         complemento_endereco_entrega: '',
#         cidade_endereco_entrega: 'São Carlos',
#         estado_endereco_entrega: 'SP',
#         cep_endereco_entrega: '13562350',
#         telefone_entrega: '34166404',
#         ddd_entrega: '16',
#         ddi_entrega: '55',
#         codigo_tipo_telefone_entrega: 1,
#         telefone_adicional_entrega: '34166404',
#         ddd_adicional_entrega: '16',
#         ddi_adicional_entrega: '55',
#         codigo_tipo_telefone_adicional_entrega: 1,
#       }

#       # Pedido
#       itens_do_pedido = [
#         {
#           codigo_produto: 1,
#           codigo_categoria: 1,
#           nome_produto: 'Produto 1',
#           nome_categoria: 'Categoria 1',
#           quantidade_produto: 1,
#           valor_unitario_produto: 50
#         },
#         {
#           codigo_produto: 1,
#           codigo_categoria: 1,
#           nome_produto: 'Produto 1',
#           nome_categoria: 'Categoria 1',
#           quantidade_produto: 1,
#           valor_unitario_produto: 50
#         }
#       ]

#       # Dados da venda
#       transacao_completa = {
#         numero_transacao: 104,
#         codigo_estabelecimento: 1369338339932,
#         codigo_forma_pagamento: 120,
#         valor: 100,
#         valor_desconto: 0,
#         taxa_embarque: 0,
#         parcelas: 1,
#         nome_titular_cartao_credito: 'Marcelo',
#         numero_cartao_credito: '4444333322221111',
#         codigo_seguranca: '123',
#         data_validade_cartao: '12/2016',
#         url_campainha: 'teste',
#         ip: '187.39.185.39',
#         idioma: 1,
#         origem_transacao: 1,
#         campo_livre1: '',
#         campo_livre2: '',
#         campo_livre3: '',
#         campo_livre4: '',
#         campo_livre5: '',
#         campo_livre6: '',
#         dados_usuario_transacao: usuario_transacao,
#         itens_do_pedido: itens_do_pedido
#       }

#       # chamada de resposta
#       resposta = @client.call(:pagamento_transacao_completa) do
#         message transacao: transacao_completa, usuario: usuario, senha: senha
#       end

#       data = resposta.to_array(:pagamento_transacao_completa_response, :return).first
#       data[:autorizacao].must_equal '0'
#       data[:codigo_estabelecimento].must_equal '1369338339932'
#       data[:codigo_forma_pagamento].must_equal '120'
#       data[:codigo_transacao_operadora].must_equal '0'
#       # data[:data_aprovacao_operadora].must_equal '21/06/2013'
#       # data[:mensagem_venda].must_equal 'Autorizada'
#       data[:numero_transacao].must_equal '104'
#       data[:parcelas].must_equal '1'
#       data[:status_transacao].must_equal '31'
#       data[:taxa_embarque].must_equal '0'
#       data[:valor].must_equal '100'
#       data[:valor_desconto].must_equal '0'

#     end
#   end

# end
