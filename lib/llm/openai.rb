# frozen_string_literal: true

require "openai"

module LLM
  class OpenAI < Base

    DEFAULTS = {
      temperature: 0.0,
      completion_model_name: "text-davinci-003",
      embeddings_model_name: "text-embedding-ada-002",
      dimension: 1536
    }.freeze

    def initialize(api_key:)
      # TODO: Add support to pass `organization_id:`
      @client = ::OpenAI::Client.new(access_token: api_key)
    end

    # Generate an embedding for a given text
    # @param text [String] The text to generate an embedding for
    # @return [Array] The embedding
    def embed(text:)
      response = client.embeddings(
        parameters: {
          model: DEFAULTS[:embeddings_model_name],
          input: text
        }
      )
      response.dig("data").first.dig("embedding")
    end

    # Generate a completion for a given prompt
    # @param prompt [String] The prompt to generate a completion for
    # @return [String] The completion
    def complete(prompt:)
      response = client.completions(
        parameters: {
          model: DEFAULTS[:completion_model_name],
          temperature: DEFAULTS[:temperature],
          prompt: prompt
        }
      )
      response.dig("choices").first.dig("text")
    end

    alias_method :generate_completion, :complete
    alias_method :generate_embedding, :embed
  end
end