class AwardingBadgesService
  RULES = {
    category:       "CategoryRuleSpecification",
    level:          "LevelRuleSpecification",
    first_attempt:  "FirstAttemptRuleSpecification"
  }.freeze

  class << self
    def call(test_passage)
      @test_passage = test_passage
      Badge.find_each do |badge|
        rule = call_badge_rule(badge)
        add_badge(badge) if rule.satisfies?
      end
    end
  
    private
  
    def call_badge_rule(badge)
      "Badges::#{RULES[badge.rule_name.to_sym]}".constantize.new(rule_value: badge.rule_value, test_passage: @test_passage)
    end
  
    def add_badge(badge)
      @test_passage.user.badges << badge
    end
  end
end
