require "test_helper"
require "test_helpers/system_test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include SystemTestHelper

  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
end
