# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# (no custom nodes to install)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/digiplay/DreamShaper_8/blob/main/dreamshaper_8.safetensors --relative-path models/checkpoints --filename dreamshaper_8.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
