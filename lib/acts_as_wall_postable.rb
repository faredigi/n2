require 'active_record'

module Newscloud
  module Acts
    module WallPostable

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_wall_postable
          include Newscloud::Acts::WallPostable::InstanceMethods
        end
                        
      end

      module InstanceMethods
        attr_accessor :post_wall

        def wall_postable?
          true
        end
        
        def wall_caption
          return ''
        end

        def post_wall?
          post_wall and post_wall.to_i != 0
        end  

      end
    end
  end
end
