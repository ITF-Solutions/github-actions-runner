# github-actions-runner

Minimal JIT-capable GitHub Actions self-hosted runner image, for use with [ITF-Solutions/github-actions-webhook](https://github.com/ITF-Solutions/github-actions-webhook).

## What it does

Extends the official [`ghcr.io/actions/actions-runner`](https://github.com/actions/runner/pkgs/container/actions-runner) base image with a single change:

```dockerfile
ENTRYPOINT ["/home/runner/run.sh"]
```

`run.sh` reads the `ACTIONS_RUNNER_INPUT_JITCONFIG` environment variable supplied by the webhook and self-configures the runner before executing, enabling fully ephemeral JIT runners with no pre-registration step.

## Using it

Set `RUNNER_IMAGE` in your webhook deployment:

```
RUNNER_IMAGE=ghcr.io/itf-solutions/github-actions-runner:latest
```

The webhook passes `ACTIONS_RUNNER_INPUT_JITCONFIG` into the container at runtime.

## Extending it

Add your own tooling on top of this image:

```dockerfile
FROM ghcr.io/itf-solutions/github-actions-runner:latest

RUN sudo apt-get update && sudo apt-get install -y <your-tools>
```
