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

  end

end