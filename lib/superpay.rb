# -*- encoding : utf-8 -*-
require "superpay/version"
require 'savon'

module Superpay
  
  autoload :Conector, 'superpay/conector'
  autoload :Configuracao, 'superpay/configuracao'
  autoload :Helper, 'superpay/helper'
  autoload :Transacao, 'superpay/transacao'

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

  def self.conector
    Conector.instance
  end

end
