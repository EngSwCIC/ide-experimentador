class TrialResult
    attr_reader :status;
    attr_reader :position_x;
    attr_reader :position_y;
    attr_reader :battery;

    def initialize(data) #TrialExecution object
        @position_x = "-";
        @position_y = "-";
        @battery = "-";
        @status = (data.status == nil or data.status.match("^\s*$")) ? "N/A" : data.status;
        if data.log != nil
          if data.log.match(".*'x':\s*(.+?)(,|})") != nil
            @position_x = data.log.match(".*'x':\s*(.+?)(,|})")[1];
          end
          if data.log.match(".*'y':\s*(.+?)(,|})") != nil
            @position_y = data.log.match(".*'y':\s*(.+?)(,|})")[1];
          end
          if data.log.match(".*'battery-level':\s*'(.+?)'(,|})") != nil
            @battery = data.log.match(".*'battery-level':\s*'(.+?)'(,|})")[1];
          end
        end
    end
end

class TrialExecution < ApplicationRecord
    belongs_to :trial
end
