require 'spec_helper'

describe User do
  
  describe "validations" do
    it { should have_one(:company) }
  end

end
