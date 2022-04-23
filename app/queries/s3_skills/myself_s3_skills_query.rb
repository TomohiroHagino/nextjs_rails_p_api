module S3Skills
  class MyselfS3SkillsQuery < Query
    def initialize(relation = S3Skill.all)
      @relation = relation
    end

    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def call
      @relation.eager_load(:me).
                where(s3_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end