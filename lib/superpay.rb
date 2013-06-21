# -*- encoding : utf-8 -*-
require "superpay/version"

module Superpay
  
  autoload :Configuracao, 'superpay/configuracao'
  autoload :Transacao, 'superpay/transacao'
  autoload :Helper, 'superpay/helper'

  #
  # Configura a conexão com o gateway.
  # Utlização:
  #
  # Superpay.config do |config|
  #   config.ambiente         = :teste
  #   config.estabelecimento  = 1111111
  #   config.usuario          = 'ERNET'
  #   config.senha            = 'ERNET'
  # end
  def self.config
    yield(Configuracao.instance) if block_given?
    return Configuracao.instance
  end

end
