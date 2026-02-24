# Project Context: ML/AI Project

## General Instructions
- Reproducibility is critical: pin random seeds, log hyperparameters
- Use git for code, DVC or similar for data/model versioning
- Document all experiments with clear metrics

## Code Organization
- Separate data loading, model definition, training, evaluation
- Use configuration files (YAML/TOML) for hyperparameters
- Never hardcode paths — use environment variables or config

## Best Practices
- Start simple, iterate complexity
- Always have a baseline to compare against
- Monitor training with proper logging (wandb, tensorboard)
- Validate on held-out data, not training data
- Check for data leakage between train/val/test splits

## Deployment
- Export models in standard formats (ONNX, TorchScript, SavedModel)
- Include preprocessing in the inference pipeline
- Add input validation and output post-processing
- Monitor model performance in production (data drift, accuracy)
