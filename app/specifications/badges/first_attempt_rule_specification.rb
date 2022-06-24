module Badges
  class FirstAttemptRuleSpecification < AbstractRuleSpecification
    def satisfies?
      return false unless @test_passage.successful?

      if @rule_value == "on"
        TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
      else
        false
      end
    end
  end
end
