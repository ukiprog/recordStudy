class RecordController < ApplicationController

  def index # 今週の学習記録
    getStartWeek(Date.today)
    getWeekRecords(@startWeek)
    @record = Record.new
    @subject = Subject.all
  end

  def create
    if Record.create(createRecordParams)
      redirect_to root_path
    else
      render :index
    end
  end

  #------------------------------------------------
  private
  def getStartWeek(date)
    @startWeek = date - (date.wday == 0 ? 6 : (date.wday - 1))
  end

  def getWeekRecords(from)
    records = current_user.records.where("start >= ? AND start < ?", from, from + 7).order(start: :asc, end: :asc)

    @records = {}
    for i in 0..6
      date = from + i
      @records[date] = []
      records.each do |record|
        if record.start >= date and record.start < date + 1
          @records[date].push(record)
        end
      end
    end
  end

  def createRecordParams
    params.require(:record).permit(:start, :end, :subject_id, :comment, :user_id)
  end
end
