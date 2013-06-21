# -*- encoding : utf-8 -*-
require 'minitest/autorun'
require 'savon'
require 'superpay'
require 'brdinheiro/dinheiro'

describe Superpay::Helper do

  describe "validação" do

    it "deveria retornar o valor inteiro correto" do
      # Para R$ 1,00
      Superpay::Helper.to_superpay_number(1).must_equal 100
      Superpay::Helper.to_superpay_number(Dinheiro.new(1)).must_equal 100
      Superpay::Helper.to_superpay_number(1.0).must_equal 100
      Superpay::Helper.to_superpay_number(Dinheiro.new(1.0)).must_equal 100
      Superpay::Helper.to_superpay_number('1').must_equal 100
      Superpay::Helper.to_superpay_number(Dinheiro.new('1')).must_equal 100
      Superpay::Helper.to_superpay_number('1.0').must_equal 100
      Superpay::Helper.to_superpay_number(Dinheiro.new('1.0')).must_equal 100
      Superpay::Helper.to_superpay_number(Dinheiro.new('1,00')).must_equal 100

      # Para 15
      Superpay::Helper.to_superpay_number(15).must_equal 1500
      Superpay::Helper.to_superpay_number(Dinheiro.new(15)).must_equal 1500
      Superpay::Helper.to_superpay_number(15.0).must_equal 1500
      Superpay::Helper.to_superpay_number(Dinheiro.new(15.0)).must_equal 1500
      Superpay::Helper.to_superpay_number('15').must_equal 1500
      Superpay::Helper.to_superpay_number(Dinheiro.new('15')).must_equal 1500
      Superpay::Helper.to_superpay_number('15.0').must_equal 1500
      Superpay::Helper.to_superpay_number(Dinheiro.new('15.0')).must_equal 1500
      Superpay::Helper.to_superpay_number(Dinheiro.new('15,00')).must_equal 1500

      # Para 167
      Superpay::Helper.to_superpay_number(167).must_equal 16700
      Superpay::Helper.to_superpay_number(Dinheiro.new(167)).must_equal 16700
      Superpay::Helper.to_superpay_number(167.0).must_equal 16700
      Superpay::Helper.to_superpay_number(Dinheiro.new(167.0)).must_equal 16700
      Superpay::Helper.to_superpay_number('167').must_equal 16700
      Superpay::Helper.to_superpay_number(Dinheiro.new('167')).must_equal 16700
      Superpay::Helper.to_superpay_number('167.0').must_equal 16700
      Superpay::Helper.to_superpay_number(Dinheiro.new('167.0')).must_equal 16700
      Superpay::Helper.to_superpay_number(Dinheiro.new('167,00')).must_equal 16700

      # Para 1234
      Superpay::Helper.to_superpay_number(1234).must_equal 123400
      Superpay::Helper.to_superpay_number(Dinheiro.new(1234)).must_equal 123400
      Superpay::Helper.to_superpay_number(1234.0).must_equal 123400
      Superpay::Helper.to_superpay_number(Dinheiro.new(1234.0)).must_equal 123400
      Superpay::Helper.to_superpay_number('1234').must_equal 123400
      Superpay::Helper.to_superpay_number(Dinheiro.new('1234')).must_equal 123400
      Superpay::Helper.to_superpay_number('1234.0').must_equal 123400
      Superpay::Helper.to_superpay_number(Dinheiro.new('1234.0')).must_equal 123400
      Superpay::Helper.to_superpay_number(Dinheiro.new('1234,00')).must_equal 123400
      Superpay::Helper.to_superpay_number(Dinheiro.new('1.234,00')).must_equal 123400
    end

    it "deveria retornar o valor flutuante inteiro" do
      # Para R$ 1,30
      Superpay::Helper.to_superpay_number(1.3).must_equal 130
      Superpay::Helper.to_superpay_number(Dinheiro.new(1.3)).must_equal 130
      Superpay::Helper.to_superpay_number(1.3).must_equal 130
      Superpay::Helper.to_superpay_number(Dinheiro.new(1.3)).must_equal 130
      Superpay::Helper.to_superpay_number('1.3').must_equal 130
      Superpay::Helper.to_superpay_number(Dinheiro.new('1.3')).must_equal 130
      Superpay::Helper.to_superpay_number(Dinheiro.new('1,30')).must_equal 130

      # Para R$ 1,35
      Superpay::Helper.to_superpay_number(1.35).must_equal 135
      Superpay::Helper.to_superpay_number(Dinheiro.new(1.35)).must_equal 135
      Superpay::Helper.to_superpay_number(1.35).must_equal 135
      Superpay::Helper.to_superpay_number(Dinheiro.new(1.35)).must_equal 135
      Superpay::Helper.to_superpay_number('1.35').must_equal 135
      Superpay::Helper.to_superpay_number(Dinheiro.new('1.35')).must_equal 135
      Superpay::Helper.to_superpay_number(Dinheiro.new('1,35')).must_equal 135

      # Para R$ 12,35
      Superpay::Helper.to_superpay_number(12.35).must_equal 1235
      Superpay::Helper.to_superpay_number(Dinheiro.new(12.35)).must_equal 1235
      Superpay::Helper.to_superpay_number(12.35).must_equal 1235
      Superpay::Helper.to_superpay_number(Dinheiro.new(12.35)).must_equal 1235
      Superpay::Helper.to_superpay_number('12.35').must_equal 1235
      Superpay::Helper.to_superpay_number(Dinheiro.new('12.35')).must_equal 1235
      Superpay::Helper.to_superpay_number(Dinheiro.new('12,35')).must_equal 1235

      # Para R$ 1267,35
      Superpay::Helper.to_superpay_number(1267.35).must_equal 126735
      Superpay::Helper.to_superpay_number(Dinheiro.new(1267.35)).must_equal 126735
      Superpay::Helper.to_superpay_number(1267.35).must_equal 126735
      Superpay::Helper.to_superpay_number(Dinheiro.new(1267.35)).must_equal 126735
      Superpay::Helper.to_superpay_number('1267.35').must_equal 126735
      Superpay::Helper.to_superpay_number(Dinheiro.new('1267.35')).must_equal 126735
      Superpay::Helper.to_superpay_number(Dinheiro.new('1267,35')).must_equal 126735
      Superpay::Helper.to_superpay_number(Dinheiro.new('1.267,35')).must_equal 126735
    end

    it "deveria voltar zero quando parametro for errado" do
      Superpay::Helper.to_superpay_number('não número').must_equal 0
      Superpay::Helper.to_superpay_number('bolagato69bola7').must_equal 0
      Superpay::Helper.to_superpay_number('2bolagato69bola7').must_equal 200
      Superpay::Helper.to_superpay_number('').must_equal 0
    end

  end

end