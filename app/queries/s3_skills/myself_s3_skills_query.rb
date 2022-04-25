module S3Skills
  class MyselfS3SkillsQuery < Query
    def initialize(relation = S3Skill.all)
      @relation = relation
    end

    def call
      @relation.select('s3_skills.id,s3_skills.title,s3_skills.body')
               .joins(:me)
               .where(s3_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end