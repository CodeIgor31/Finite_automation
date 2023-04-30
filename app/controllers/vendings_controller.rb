class VendingsController < ApplicationController
  include VendingsHelper
  def index
    $a = 0
    $b = 1
    $c = 2
    $d = 3
    $e = 4
    $fir_out = "Получение товара"    
    $sec_out = "Получение сдачи"
    $third_out = "Отображение на экране меню"
    $four_out = "Повтор"
    i = 1
    @hash = {}
    while i <= 48
      @hash[i] = 50+rand(200)
      i += 1
    end
    @@hash_for_cl = @hash
    $tek = ["q0", $third_out]
  end

  def activise
    $tek = process_event($tek[0], $c)
  end

  def check_num
    @@num = params[:tov_num]
    if (@@num == nil || @@num == "" || (@@num.to_i > 48 || @@num.to_i < 1))
      $tek = process_event($tek[0], $d)
      return
    else
      $tek = process_event($tek[0], $b)
    end
    @@sum = 0
    @need = @@hash_for_cl[@@num.to_i] - @@sum
  end

  def check_money
    @money = params[:money]
    if @money.to_i <= 0 or @money == ""
      @need = @@hash_for_cl[@@num.to_i] - @@sum
      $tek = process_event($tek[0], $e)
      return
    end
    @@sum += @money.to_i
    if @@sum.to_i >= @@hash_for_cl[@@num.to_i]
      $tek = process_event($tek[0], $a)
    else
      @need = @@hash_for_cl[@@num.to_i] - @@sum
      $tek = process_event($tek[0], $e)
    end
  end

  def skip
    @sdacha = @@sum
    $tek = process_event($tek[0], $c)
  end 

  def give_product
    $tek = process_event($tek[0], $c)
    @sdacha = (@@sum - @@hash_for_cl[@@num.to_i]).abs
  end

  def give_sdacha
    $tek = process_event($tek[0], $c)
  end
end
