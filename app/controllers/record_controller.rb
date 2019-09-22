class RecordController < ApplicationController

  def index # 今週の学習記録
    @startWeek = getStartWeek(Date.today)
    @subject = Subject.all
    @records = getWeekRecords(@startWeek, @subject)
    @record = Record.new
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
    startWeek = date - (date.wday == 0 ? 6 : (date.wday - 1))
    return startWeek
  end

  def getWeekRecords(from, subject)
    data = current_user.records.where("start >= ? AND start < ?", from, from + 7).order(start: :asc, end: :asc)
    records = {}
    for i in 0..6
      date = from + i
      records[date] = []
      data.each do |record|
        if record.start >= date and record.start < date + 1
          records[date].push(record)
        end
      end
      records[date].push({ summary: getSummary(records[date], subject) })
    end

    return records
  end

  def getSummary(record, subjects)
    summary = {}
    subjects.each do |subject|
      summary[subject.id] = 0
      record.each do |f|
        if f.subject_id == subject.id
          summary[subject.id] += f.end - f.start
        end
      end
    end

    return summary
  end

  def createRecordParams
    params.require(:record).permit(:start, :end, :subject_id, :comment, :user_id)
  end
end
