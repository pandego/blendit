# blend🍸t
A simple LLM blender, to easily combine the best available open-source large language models into a super one.

### Pre-requisites
- [git](https://git-scm.com)
- [Miniconda](https://docs.anaconda.com/free/miniconda/miniconda-other-installer-links/)

## 1. Setup your Environment
### Install Dependencies
- Clone this repository and navigate into it:
    ```bash
    git clone https://github.com/pandego/blendit.git
    cd blendit
    ```

- Create and activate your Python Environment:
    ```bash
    conda env create -f envrionment.yml
    conda activate blendit
    ```

- Initiate your project with `poetry`:
    ```bash
    poetry install
    ```

That's it for the Python environment!

## 2. Blend it
In order to blend models you will have to setup a `config.yaml` file with the instructions for the blend. You can find some examples in `src/config/`.

- Run the follow command to launch the blend, and let it shake 🍸

```bash
mergekit-yaml src/config/example_task_arithmetic.yaml models/merged-models/my-first-blend \
--allow-crimes \         # experimental: allows blends of different model architectures
--copy-tokenizer \       # copies the tokenizer from the base model
--out-shard-size 1B \    # splits model so it can be load in smaller RAMs (default: parse_kmb("5B"))
--lazy-unpickle \        # experimental: lowers memory usage
--write-model-card \
--low-cpu-memory
--random-seed 123
```

- If you need to download a set of models to get started with the example above, you can run the following command:
    ```bash
    bash download_models.sh
    ```

---

#TODOs

    [ ] Add way to test model locally
    [ ] Add way to submit it to HF for evaluation
    [ ] Wrap it all up in a nice Streamlit App 
    [ ] Dockerize it, deploy it!
