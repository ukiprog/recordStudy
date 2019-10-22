class TeacherRecordController < ApplicationController
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

  #------------------------------------------------
  private
  def getStartWeek(aDay)
    startWeek = aDay - (aDay.wday == 0 ? 6 : (aDay.wday - 1))
    return startWeek
  end

end
