class AwardingBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
    @successful_test_ids = @user.test_passages.successful.pluck(:test_id).uniq.sort
  end

  def call
    Badge.find_each.select { |badge| satisfy_rule?(badge) }
  end

  private

  def satisfy_rule?(badge)
    send("#{badge.rule_name}_badge?", badge.rule_value)
  end

  def level_badge?(level)
    return false unless @test_passage.successful?

    level_test_ids = Test.where(level: level).ids.sort
    (@successful_test_ids & level_test_ids) == level_test_ids
  end

  def category_badge?(category_id)
    return false unless @test_passage.successful?

    category_test_ids = Test.where(category_id: category_id).ids.sort
    (@successful_test_ids & category_test_ids) == category_test_ids
  end

  def first_attempt_badge?(on_or_off)
    return false unless @test_passage.successful?

    if on_or_off == "on"
      @user.test_passages.successful.where(test: @test).count == 1
    else
      false
    end
  end
end
