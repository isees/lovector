+++
title = "Vscode activates conda but points to the default python"
date = "2019-07-19T16:33:32+08:00"
draft = false
tags = ["vscode", "anaconda", "conda", "python", "mac"]
topics = []
description = ""
+++

## Behavior

When `conda activate env`, terminal states that env is activated - prints (env) at the beginning of the line. Same with the interpreter - VScode sees it and I am able to select it.

However, `which python` points to the default python on MacOS, and therefore none python 3.6-dependent packages work. Same with the interpreter - VScode fails to find packages which are installed in the env

## How to solve

### 1. Open settings

![Open Settings](https://user-images.githubusercontent.com/19368794/61522055-219dd280-aa44-11e9-8311-3dd7de6945bd.png)

### 2. Modify configuration

Add following content to configuration

```bash
  "terminal.integrated.env.osx": {
    "PATH": ""
  }
```

![Modify env config](https://user-images.githubusercontent.com/19368794/61522129-472adc00-aa44-11e9-9dd2-7be21626d253.png)

### 3. Restart VSCode

Then the `$PATH` will be the same as the external terminal.

![Activate success](https://user-images.githubusercontent.com/19368794/61524220-93781b00-aa48-11e9-8c03-49d06d764e23.png)

## References

- [vscode activates conda but points to the default python](https://github.com/Microsoft/vscode-python/issues/4434)
