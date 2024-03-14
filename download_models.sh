echo "Checking if git-lfs is installed..."

if [ -x "$(command -v git-lfs)" ]; then
  echo "git-lfs is already installed!"
else
  echo "git-lfs is not installed, please install it from https://git-lfs.github.com"
  exit 1
fi

cd models

echo "Downloading models, this might take a while!"

git lfs clone https://huggingface.co/SanjiWatsuki/Kunoichi-DPO-v2-7B \
&& git lfs clone https://huggingface.co/paulml/NeuralOmniWestBeaglake-7B \
&& git lfs clone https://huggingface.co/mistralai/Mistral-7B-Instruct-v0.2

echo "All models downloaded successfully!"