# frozen_string_literal: true

RSpec.describe Prompt::ZeroShotPromptTemplate do
  let!(:prompt_template) { described_class.new(template: "Tell me a joke.") }

  describe "#initialize" do
    it "creates a new instance" do
      expect(described_class.new(template: "Tell me a joke.")).to be_a(Prompt::ZeroShotPromptTemplate)
    end
  end

  describe "#format" do
    it "creates prompt template" do
      expect(prompt_template.format).to eq("Tell me a joke.")
      expect(prompt_template.format(text: 'Hello')).to eq("Tell me a joke.")
    end
  end

  describe "#to_h" do
    it "returns Hash representation of prompt template" do
      expect(prompt_template.to_h).to eq({
        _type: "zero_shot",
        template: "Tell me a joke."
      })
    end
  end
end
