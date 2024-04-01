# --- 🚧 UNDER CONSTRUCTION 🚧 --- #
# This script is a work in progress and is not yet functional
# In summary, the script will upload a model to the Hugging Face model hub
# The script will require the user to have an access token and write permission to the Hugging Face model hub
# The script will also require the user to have the Hugging Face CLI installed
# The script will require the user to have a Hugging Face account
# The script will require the user to have a model directory to upload
# The script will require the user to have a Hugging Face username
# The script will require the user to have a model name

# Get HF_TOKEN from User
read -p "Please enter your HuggingFace Token: " HF_TOKEN
read -p "Please enter your HuggingFace Username: " HF_USERNAME
read -p "Please enter your Model's name: " MODEL_NAME

# log in to huggingface with an access token (must have write permission)
huggingface-cli login --token $HF_TOKEN

# upload your model
huggingface-cli upload --repo-type model $HF_USERNAME/$MODEL_NAME models/merged-models/$MODEL_NAME
