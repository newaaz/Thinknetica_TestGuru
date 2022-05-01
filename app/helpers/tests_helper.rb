module TestsHelper
  def test_level(test)
    test_levels = { 0 => I18n.t('.level.easy'),
                    1 => I18n.t('.level.elementary'),
                    2 => I18n.t('.level.advanced'),
                    3 => I18n.t('.level.hard') }
    test_levels[test.level] || I18n.t('.level.hero')
  end
end
