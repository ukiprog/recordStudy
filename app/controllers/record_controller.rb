class RecordController < ApplicationController
  def index
    # 仮組み
    @startWeek = getStartWeek(Date.today)
    @recordList = { '1H5' => [Date.new(2017,4,1), Date.new(2018,3,31)], '2H1' => [Date.new(2018,04,01), Date.new(2019,03,31)], '3H1' => [Date.new(2019,04,01), @startWeek]}
  end

  def show # 今週の学習記録
    @startWeek = getStartWeek(Date.today)
    @subjects = Subject.all
    @records = getWeekRecords(@startWeek, @subjects)
    @record = Record.new
  end

  def create
    if Record.create(createRecordParams)
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
    record = Record.find(params[:id])
    render json: record
  end

  def update
    record = Record.find(params[:id])
    if record.update(editRecordParams)
      redirect_to root_path
    else
      render :show
    end
  end

  def destroy
    record = Record.find(params[:id])
    if record.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  #------------------------------------------------
  private
  def getStartWeek(aDay)
    startWeek = aDay - (aDay.wday == 0 ? 6 : (aDay.wday - 1))
    return startWeek
  end

  def getWeekRecords(from, subjects)
    data = current_user.records.where("start >= ? AND start < ?", from, from + 7).order(start: :asc, end: :asc)
    records = {}
    for i in 0..6
      aDay = from + i
      records[aDay] = []
      data.each do |value|
        if value.start >= aDay and value.start < aDay + 1
          records[aDay].push(value)
        end
      end
      records[aDay].push({ summary: getSummary(records[aDay], subjects) })
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

  def editRecordParams
    params.permit(:id, :start, :end, :subject_id, :comment, :user_id)
  end
end
