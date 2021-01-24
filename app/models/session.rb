class Session < ApplicationRecord
    def self.sweep(time = 1.hour)
      if time.is_a?(String)
        time = time.split.inject { |count, unit| count.to_i.send(unit) }
      end
  
      where("updated_at < ?", time.ago.to_s(:db)).delete_all
    end

    
end