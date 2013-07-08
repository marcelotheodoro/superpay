# -*- encoding : utf-8 -*-
require 'minitest/autorun'
require 'superpay'

describe Superpay::Configuracao do

  before do

    Superpay.config do |config|
      config.ambiente         = :teste
      config.estabelecimento  = 1111111
      config.usuario          = 'ERNET'
      config.senha            = 'ERNET'
    end

  end

  it "deveria configurar corretamente" do
    Superpay.config.ambiente_teste?.must_equal true
    Superpay.config.ambiente_producao?.must_equal false
    Superpay.config.estabelecimento.must_equal 1111111
    Superpay.config.usuario.must_equal 'ERNET' 
    Superpay.config.senha.must_equal 'ERNET' 
  end

  it "deveria manter os dados configurados" do
    Superpay.config.ambiente_teste?.must_equal true
    Superpay.config.ambiente_producao?.must_equal false
    Superpay.config.estabelecimento.must_equal 1111111
    Superpay.config.usuario.must_equal 'ERNET' 
    Superpay.config.senha.must_equal 'ERNET' 
  end

  it "deveria sobrecarregar os dados configurados" do

    Superpay.config do |config|
      config.ambiente         = :producao
      config.estabelecimento  = 222222
      config.usuario          = 'qw3'
      config.senha            = 'qw31'
    end

    Superpay.config.ambiente_teste?.must_equal false
    Superpay.config.ambiente_producao?.must_equal true
    Superpay.config.estabelecimento.must_equal 222222
    Superpay.config.usuario.must_equal 'qw3' 
    Superpay.config.senha.must_equal 'qw31' 

  end

end