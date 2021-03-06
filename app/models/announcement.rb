class Announcement < ActiveRecord::Base
  validates_presence_of :title
  validates_format_of :url, :with => /\Ahttp(s?):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/i, :message => "should look like a URL", :allow_blank => true
  validates_length_of   :prefix,    :within => 3..15
  validates_length_of   :title,    :within => 3..80
  named_scope :newest, lambda { |*args| { :order => ["created_at desc"], :limit => (args.first || 1)} }
end
