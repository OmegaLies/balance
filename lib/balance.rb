module Balance
  def balance(rate, rubles, dollars)
    dollars_to_rubles = (dollars * rate).round(2)
    if (rubles - dollars_to_rubles).abs <= 0.01 * rate
      "Ваш портфель сбалансирован!"
    elsif rubles > dollars_to_rubles
      sell = rubles - (rubles + dollars_to_rubles) / 2
      "Вам нужно продать #{sell.round(2)}Р"
    else
      sell = dollars_to_rubles - (rubles + dollars_to_rubles) / 2
      "Вам нужно продать #{(sell / rate).round(2)}$"
    end
  end
  
  module_function :balance
end
