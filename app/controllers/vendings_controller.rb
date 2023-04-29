class VendingsController < ApplicationController
  include VendingsHelper
  def index
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
    $tek = process_event($tek, 1)
  end

  def check_num
    @@num = params[:tov_num]
    (@@num == nil || @@num == "" || (@@num.to_i > 48 || @@num.to_i < 1)) ? $tek = process_event($tek, 2) : $tek = process_event($tek, 1)
    @@sum = 0
  end

  def check_money
    @money = params[:money]
    if @money.to_i <= 0 or @money == ""
      $tek = process_event($tek, 2)
      return
    end
    @@sum += @money.to_i
    if @@sum.to_i >= @@hash_for_cl[@@num.to_i]
      $tek = process_event($tek, 1)
    else
      $tek = process_event($tek, 0)
    end
  end

  def give_product
    $tek = process_event($tek, 1)
  end

  def give_sdacha
    $tek = process_event($tek, 1)
  end
end
