require 'taiwanese_id_validator'
class CouponsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def coupon
  end

  def validate
    num = get_uniq_nums(10, 100)

    if params[:name].blank? || params[:phone].blank? || params[:phone].blank? 
      redirect_to coupon_path, notice: "沒填喔"
    elsif TwidValidator.valid?(params[:twid])
      redirect_to coupons_path, notice: "已成功兌換，您的序號為#{num} "
    else 
      redirect_to coupon_path, notice: "您的身分證字號有誤，請確認後重新輸入"
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
