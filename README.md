# blend🍸t
A simple LLM blender, to easily combine the best available open-source large language models into a super one.

## 1. Setup your Environment
### Install Dependencies
- Clone this repository and navigate into it:
    ```bash
    git clone https://github.com/pandego/blendit.git
    cd blendit
    ```

- Initiate your project with `poetry`:
    ```bash
    poetry install
    ```

---
### How I added MergeKit as a SubModule
- To add [mergekit](https://github.com/arcee-ai/mergekit) repository as a submodule, you use:
    ```bash
    git submodule add https://github.com/arcee-ai/mergekit.git src/mergekit/
    ```
- (Optional) After adding a submodule, it's good practice to initialize the submodule and fetch its data with:
    ```bash
    git submodule update --init --recursive
    ```
---

### Install [MergeKit](https://github.com/cg123/mergekit)
- Follow the following commands to setup mergekit, which is necessary to run this repo:
    ```bash
    pip install -e src/mergekit  # install the package and make scripts available
    ```

- If the above fails with the error of:
    ```bash
    ERROR: File "setup.py" or "setup.cfg" not found. Directory cannot be installed in editable mode:
    (A "pyproject.toml" file was found, but editable mode currently requires a setuptools-based build.)
    ```

- You may need to upgrade pip to > 21.3 with the command `python3 -m pip install --upgrade pip`


## 2. Blend it
In order to blend models you will have to setup a `config.yaml` file with the instructions for the blend. You can find some examples in `src/config/`.

- Run the follow command to launch the blend, and let it shake 🍸

```bash
mergekit-yaml src/config/example_task_arithmetic.yaml models/merged-models/my-first-blend/ \
--allow-crimes \         # experimental: allows blends of different model architectures
--copy-tokenizer \       # copies the tokenizer from the base model
--out-shard-size 1B \    # splits model so it can be load in smaller RAMs
--lazy-unpickle \        # experimental: lowers memory usage
--write-model-card
```

---

#TODOs

    [ ] Add way to test model locally
    [ ] Add way to submit it to HF for evaluation
    [ ] Wrap it all up in a nice Streamlit App 
    [ ] Dockerize it, deploy it!