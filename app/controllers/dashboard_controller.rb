class DashboardController < ApplicationController
  def index
    @sales_by_year =  Sale.group_by_month(:date_time, last: 12).order(:created_at).sum(:price)
                      #Sale.where(created_at: 11.months.ago..Date.today)
                      #.group("strftime('%m-%Y'),created_at")
                      #.order(:created_at, :asc)
                      #.sum(:price) 
                      
                      
    @sales_by_count = Sale.group_by_month(:date_time, last: 12).order(:created_at).count
    @sales_by_prom = Sale.group_by_month(:date_time, last: 12).order(:created_at).average(:price)

    @sales_by_origin_year = Sale.where(date_time: 11.months.ago..Date.today).group(:origin)
                            .count

    @sales_by_origin_6month = Sale.where(date_time: 5.months.ago..Date.today).group(:origin)
                              .count
    @sales_by_origin_last3month = Sale.where(date_time: 2.months.ago..Date.today).group(:origin)
                                  .count
    @sales_by_origin_lastmonth = Sale.where(date_time: 1.months.ago..Date.today).group(:origin)
                                .count

    @sales_by_blend_year = Sale.where(date_time: 11.months.ago..Date.today).group(:blend)
                            .count
    @sales_by_blend_6month = Sale.where(date_time: 5.months.ago..Date.today).group(:blend)
                              .count
    @sales_by_blend_last3month = Sale.where(date_time: 2.months.ago..Date.today).group(:blend)
                                .count
    @sales_by_blend_lastmonth = Sale.where(date_time: 1.months.ago..Date.today).group(:blend)
                                .count
  end
end
