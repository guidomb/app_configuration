require 'spec_helper'

describe AppConfiguration::OptionalAttr do

  context 'when included into a class' do

    let(:klass) { Class.new { include AppConfiguration::OptionalAttr } }

    it 'defines the optional_attr method' do
      klass.respond_to?(:optional_attr, true).should be_true
    end

    describe ".optional_attr" do

      context "when invoked for the attribute 'foo'" do
        
        before do
          klass.class_eval { optional_attr :foo }
        end

        let(:instance) do 
          klass.new 
        end

        it "defines the 'foo' public method" do
          instance.should respond_to(:foo).with(1).argument
        end

        describe "#foo" do

          it "sets the instance variable @foo with the given value" do
            instance.foo 1
            instance.instance_variable_get("@foo").should be 1
          end

        end

      end

      context "when invoked for the attribute 'bar' with default option value '1'" do

        before do
          klass.class_eval { optional_attr :bar, default: 1 }
        end

        let(:instance) do 
          klass.new 
        end

        it "sets the instance variable @bar with the default value" do
          instance.instance_variable_get("@bar").should eq 1
        end

      end

    end

  end

end