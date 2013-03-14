require 'spec_helper'

describe AppConfiguration::Config do
  
  before(:all) do
    AppConfiguration::Config.default_local_path = File.join(fixture_path, 'local')
    AppConfiguration::Config.default_global_path = File.join(fixture_path, 'global')
  end

  after(:all) do
    AppConfiguration::Config.default_local_path = nil
    AppConfiguration::Config.default_global_path = nil
  end

  describe "#[]" do

    context "when there is only a global config file" do

      let(:config) do
        AppConfiguration::Config.new('config.yml') do
          base_local_path ''
          use_env_variables false
        end
      end

      it 'returns the resquested config parameter value' do
        config['variable1'].should eq 'global1'
      end

    end

    context "when there is only a local config file" do

      let(:config) do
        AppConfiguration::Config.new('config.yml') do
          base_global_path ''
          use_env_variables false
        end
      end

      it 'returns the resquested config parameter value' do
        config['variable1'].should eq 'local1'
      end

    end

    context "when there are local and global config files" do

      let(:config) do
        AppConfiguration::Config.new('config.yml') do
          use_env_variables false
        end
      end

      it 'returns the local config parameter value' do
        config['variable1'].should eq 'local1'
      end

    end

    context "when environmental variables config parameters exists" do

      before(:each) do
        ENV.stub(:[]).with("VARIABLE1").and_return("env1")
      end

      context "when use_env_variables is set to false" do

        let(:config) do
          AppConfiguration::Config.new('config.yml') do
            use_env_variables false
          end
        end

        it 'returns the local config parameter value' do
          config['variable1'].should eq 'local1'
        end

      end

      context "when use_env_variables is set to true" do
      
        let(:config) do
          AppConfiguration::Config.new('config.yml') do
            use_env_variables true
          end
        end

        it 'returns the environmental variable config parameter value' do
          config['variable1'].should eq 'env1'
        end

        context "when a prefix is set" do

          before(:each) do
            ENV.stub(:[]).with("THE_PREFIX_VARIABLE1").and_return("env1")
          end

          let(:config) do
            AppConfiguration::Config.new('config.yml') do
              use_env_variables true
              prefix 'the_prefix'
            end
          end

          it 'returns the environmental variable config parameter value' do
            config['variable1'].should eq 'env1'
          end

        end

      end

    end

  end

  describe 'dynamic method attributes' do
    let(:config) { AppConfiguration::Config.new('config.yml') }

    it 'defines dynamic method for all attributes' do
      config.variable1.should eq 'local1'
    end
  end

end