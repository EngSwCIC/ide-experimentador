require "test_helper"

TrialResultInfo = Struct.new(:status, :log)

class TrialExecutionTest < ActiveSupport::TestCase
  def assert_result_values(result, status, position_x, position_y, battery)
    assert_equal(status, result.status, "Expected status '#{result.status}' to be '#{status}'")
    assert_equal(position_x, result.position_x, "Expected position_x '#{result.position_x}' to be '#{position_x}'")
    assert_equal(position_y, result.position_y, "Expected position_y '#{result.position_y}' to be '#{position_y}'")
    assert_equal(battery, result.battery, "Expected battery '#{result.battery}' to be '#{battery}'")
  end

  test_cases = [
    ["success", { battery_level: 50, x: 2, y: 2 }, "2", "2", "25"],
    ["failed", { battery_level: 50, x: 2, y: 2 }, "2", "2", "25"],
    ["failed", nil, "-", "-", "-"],
    [nil, nil, "N/A", "-", "-", "-"],
    ["", "", "N/A", "-", "-", "-"]
  ]

  test_cases.each do |status, log, position_x, position_y, battery|
    test "retorna dados do experimento com status #{status.inspect} e log #{log.inspect}" do
      data = TrialResultInfo.new(status, log)
      result = TrialResult.new(data)
      assert_result_values(result, status, position_x, position_y, battery)
    end
  end
end
