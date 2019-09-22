class RecordController < ApplicationController
  def index # 今週の学習記録
    @today = Date.today
    @startThisWeek = @today - (@today.wday == 0 ? 7 : (@today.wday - 1))
  end
end
