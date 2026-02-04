# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# Instalar curl
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Crear carpetas
RUN mkdir -p /comfyui/models/checkpoints \
    && mkdir -p /comfyui/models/vae

# Modelo 2: Juggernaut XL Ragnarok (usando mirror con nombre exacto)
RUN curl -L -o /comfyui/models/checkpoints/juggernautXL_ragnarokBy.safetensors \
    https://huggingface.co/xxiaogui/hongchao/resolve/main/juggernautXL_ragnarokBy.safetensors

# Opcional: VAE para SDXL (descomenta si lo necesitas)
# RUN curl -L -o /comfyui/models/vae/sdxl_vae.safetensors \
#     https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors
