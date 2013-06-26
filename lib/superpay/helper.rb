module Superpay

  module Helper

    #
    # Transforma um valor, seja Fixnum, String ou Float, para o formato do gateway.
    # R$ 1,00 -> 100
    # 1       -> 100
    # 1.0     -> 100
    # -1      -> 100
    def self.to_superpay_number(valor)
      ('%.2f' % valor.to_f.abs).gsub('.', '').gsub(',', '').to_i
    end

    #
    # Transforma um número de retorno do gateway em um float.
    # 100 -> 1.0
    # 10  -> 0.1
    # 500 -> 5.0
    # 320 -> 3.2
    # 241 -> 2.41
    def self.superpay_number_to_decimal(number)
      number.to_i.abs / 100.0
    end

    def self.cep_to_superpay(cep)
      cep.gsub('.', '').gsub('-', '')
    end

  end

end