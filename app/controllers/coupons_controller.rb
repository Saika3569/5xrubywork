require 'taiwanese_id_validator'
class CouponsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def coupon
  end

  def validate
    num = get_uniq_nums(10, 100)
    
    if TwidValidator.valid?(params[:twid])
      redirect_to coupons_path, notice: "已成功兌換，您的序號為#{num.to_s} "
    else
      render :coupon ,notice: "輸入有誤，請重新輸入"
  end
end

  private

  def get_uniq_nums(size, range)
    ary = []
    begin
      r = rand(range)
      if ary.member?(r)
        next
      else
        ary << r
      end
    end while( ary.length < size )
    ary
    end
  end
