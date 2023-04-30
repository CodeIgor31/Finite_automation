class VendingsController < ApplicationController
  include VendingsHelper
  def index
    $a = 1
    $b = 0
    $c = 2
    i = 1
    @hash = {}
    while i <= 48
      @hash[i] = 50+rand(200)
      i += 1
    end
    @@hash_for_cl = @hash
    $tek = "q0"
  end

  def activise
    $tek = process_event($tek, $a)
  end

  def check_num
    @@num = params[:tov_num]
    if (@@num == nil || @@num == "" || (@@num.to_i > 48 || @@num.to_i < 1))
      $tek = process_event($tek, $c)
      return
    else
      $tek = process_event($tek, $a)
    end
    @@sum = 0
    @need = @@hash_for_cl[@@num.to_i] - @@sum
  end

  def check_money
    @money = params[:money]
    if @money.to_i <= 0 or @money == ""
      @need = @@hash_for_cl[@@num.to_i] - @@sum
      $tek = process_event($tek, $b)
      return
    end
    @@sum += @money.to_i
    if @@sum.to_i >= @@hash_for_cl[@@num.to_i]
      $tek = process_event($tek, $a)
    else
      @need = @@hash_for_cl[@@num.to_i] - @@sum
      $tek = process_event($tek, $b)
    end
  end

  def skip
    @sdacha = @@sum
    $tek = process_event($tek, $c)
  end 

  def give_product
    $tek = process_event($tek, $a)
    @sdacha = (@@sum - @@hash_for_cl[@@num.to_i]).abs
  end

  def give_sdacha
    $tek = process_event($tek, $a)
  end
end
