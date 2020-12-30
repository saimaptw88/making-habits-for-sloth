# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  purpose_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_purpose_id  (purpose_id)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purpose_id => purposes.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
