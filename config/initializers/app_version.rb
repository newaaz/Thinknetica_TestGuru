# Простой вариант ?
Rails.configuration.x.test_guru.version = '0.1.0'

# так мы можем узнать версию приложения вызвав в консоли irb> AppVersion.version
module AppVersion  
  @version = '0.1.1'
  class << self
    attr_reader :version
  end
end
