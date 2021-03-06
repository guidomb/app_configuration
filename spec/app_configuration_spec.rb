require 'spec_helper'

describe AppConfiguration do
  
  describe ".for" do

    let(:config_name) { :spec }
    before(:each) { AppConfiguration.for(config_name) }

    it 'registers a new Config object' do
      AppConfiguration[config_name].should_not be_nil 
    end

    it 'sets the config_file_name attribute based on the config name' do
      AppConfiguration[config_name].instance_variable_get("@config_file_name").should eq ".#{config_name}.yml"
    end

    it 'sets the prefix attribute based on the config name' do
      AppConfiguration[config_name].instance_variable_get("@prefix").should eq config_name
    end

  end

end