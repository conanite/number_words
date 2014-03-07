require 'spec_helper'
require 'i18n'
require 'number_words/core_ext'

describe "plugin system" do

  class ElvishPlugin
    def int_to_words i, options={ }
      "#{i} in Elvish"
    end
  end

  class KlingonPlugin
    def int_to_words i, options={ }
      "#{i} in Klingon"
    end
  end

  before {
    NumberWords.add_handler :el, ElvishPlugin.new
    NumberWords.add_handler :kl, KlingonPlugin.new
  }

  it "should delegate to the registered Klingon plugin" do
    I18n.locale = :kl
    expect(123.to_words).to eq "123 in Klingon"
  end

  it "should delegate to the registered Elvish plugin" do
    I18n.locale = :el
    expect(123.to_words).to eq "123 in Elvish"
  end
end
