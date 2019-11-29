class TeacherRecordController < ApplicationController
  @record = Record.new
  def index
    @startWeek = getStartWeek(Date.today)
    attach = current_user.attaches
    @recordList = {}
    attach.each do |f|
      weekList = [getStartWeek(Date.new(f.year,4,1)), (f.year == attach[-1].year ? @startWeek : getStartWeek(Date.new(f.year+1,3,31)))]
      studentList = User.includes(:attaches).where(attaches: {attach: f.attach, year: f.year}, users: {position: 'student'})
      if @recordList[f.year].nil?
        @recordList[f.year] = {f.attach => { weekList: weekList, studentList: studentList }}
      else
        @recordList[f.year][f.attach] = { weekList: weekList, studentList: studentList }
      end
    end
  end

  def show # 学習記録
    @startWeek = Date.strptime(params[:start], '%Y-%m-%d')
    @student = User.find(params[:id])
    @subjects = Subject.all
    @records = getWeekRecords(params[:id], @startWeek, @subjects)
  end

  #------------------------------------------------
  private
  def getStartWeek(aDay)
    startWeek = aDay - (aDay.wday == 0 ? 6 : (aDay.wday - 1))
    return startWeek
  end

  def getWeekRecords(id, from, subjects)
    data = User.find(id).records.where("start >= ? AND start < ?", from, from + 7).order(start: :asc, end: :asc)
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
end
