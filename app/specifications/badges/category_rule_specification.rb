module Badges
  class CategoryRuleSpecification < AbstractRuleSpecification
    def satisfies?
      return false unless @test_passage.successful?

      rule_test_ids = Test.where(category_id: @rule_value).ids
      test_passages_count = TestPassage.successful.where(user: @test_passage.user, test: rule_test_ids).count
      rule_test_ids.count == test_passages_count
    end
  end
end
