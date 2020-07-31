# == Schema Information
#
# Table name: things
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  name       :string
#  updated_at :datetime         not null
#
class Thing < ApplicationRecord
end
