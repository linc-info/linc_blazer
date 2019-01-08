namespace :classrooms do
  desc 'migrate classroom memeber data'
  task connect_user_course: :environment do
    ApplicationRecord.transaction do

      ClassroomMember.where(classroomId: [7, 8, 9, 11, 13, 26, 27, 28, 29]).each do |classroom_member|
        ClassroomCourses.where(classroomId: classroom_member.classroomId).each do |classroom_course|
          course_member = CourseMember.find_by(courseId: classroom_course.courseId, userId: classroom_member.userId)
          p "classid: #{classroom_member.classroomId}/ courseid: #{classroom_course.courseId} / userid:#{classroom_member.userId}/ #{course_member.present?}"
          next if course_member.present?
          cm = CourseMember.create!(
            classroomId: classroom_member.classroomId,
            courseId: classroom_course.courseId,
            userId: classroom_member.userId,
            joinedType: 'classroom',
            orderId: 0,
            deadline: classroom_member.deadline,
            refundDeadline: 0,
            levelId: 0,
            learnedNum: 0,
            learnedCompulsoryTaskNum: 0,
            credit: 0,
            noteNum: 0,
            noteLastUpdateTime: 0,
            isLearned: 0,
            finishedTime: 0,
            seq: 0,
            remark: '管理员添加',
            isVisible: 1,
            role: 'student',
            locked: 0,
            createdTime: classroom_member.createdTime,
            courseSetId: classroom_course.courseSetId
          )
          p cm.to_json
        end
      end

    end
  end
end