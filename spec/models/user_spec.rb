require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:user_posts) }
  it { is_expected.to have_many(:posts).through(:user_posts) }
end
