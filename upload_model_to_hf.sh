# --- 🚧 UNDER CONSTRUCTION 🚧 --- #
# This script is a work in progress and is not yet functional

# Get info from User
read -p "Eh, what's up, Doc? Please enter your HuggingFace Token: " HF_TOKEN
read -p "And your HuggingFace Username, Doc: " HF_USERNAME
read -p "What's the name of your Model, Doc? " MODEL_NAME
read -p "Where are the merged model stored, Doc? " MODELS_DIR

# Upload your model
# huggingface-cli upload --repo-type model $HF_USERNAME/$MODEL_NAME models/merged-models/$MODEL_NAME .
huggingface-cli upload --repo-type model --token $HF_TOKEN $HF_USERNAME/$MODEL_NAME $MODELS_DIR .