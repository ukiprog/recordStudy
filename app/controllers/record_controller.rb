class RecordController < ApplicationController

  def index # 今週の学習記録
    getStartThisWeek
    getThisWeekRecords
    @record = Record.new
    @subject = Subject.all
  end

  def create
    redirect_to root_path
  end

  #------------------------------------------------
  private
  def getStartThisWeek
    today = Date.today
    @startThisWeek = today - (today.wday == 0 ? 6 : (today.wday - 1))
  end

  def getThisWeekRecords
    records = current_user.records.where("start >= ? AND end < ?", @startThisWeek, @startThisWeek + 7).order(start: :asc, end: :asc)

    @records = {}
    for i in 0..6
      date = @startThisWeek + i
      @records[date] = []
      records.each do |record|
        if record.start >= date and record.start < date + 1 then
          @records[date].push(record)
        end
      end
    end
  end
end
