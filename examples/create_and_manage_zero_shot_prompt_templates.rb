require "langchain"

# Create a prompt with no input variables
prompt = Prompt::ZeroShotPromptTemplate.new(template: "Tell me a joke.")
prompt.format # "Tell me a joke."

# Save prompt template to JSON file
prompt.save(file_path: "spec/fixtures/prompt/zero_shot_prompt_template.json")

# Loading a new prompt template using a JSON file
prompt = Prompt.load_from_path(file_path: "spec/fixtures/prompt/zero_shot_prompt_template.json")
prompt.template # "Tell me a joke."
