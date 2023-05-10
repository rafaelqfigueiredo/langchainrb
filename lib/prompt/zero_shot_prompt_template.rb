# frozen_string_literal: true

module Prompt
  class ZeroShotPromptTemplate < Base
    attr_reader :template

    #
    # Initializes a new instance of the class.
    #
    # @param template [String] The prompt template.
    #
    def initialize(template:)
      @template = template
    end

    #
    # Format the prompt with the inputs.
    #
    # @param kwargs [Hash] Any arguments to be passed to the prompt template.
    # @return [String] A formatted string.
    #
    def format(_kwargs = nil)
      template
    end

    #
    # Returns the key type of prompt as a string.
    #
    # @return [String] the prompt type key
    #
    def prompt_type
      "zero_shot"
    end

    def to_h
      {
        _type: prompt_type,
        template: @template
      }
    end
  end
end
