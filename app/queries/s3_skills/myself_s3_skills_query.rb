module S3Skills
  class MyselfS3SkillsQuery < Query
    def initialize(relation = S3Skill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(s3_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end