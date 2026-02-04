# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# Instalar curl (necesario porque la base no lo trae)
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Crear carpetas necesarias
RUN mkdir -p /comfyui/models/checkpoints \
    && mkdir -p /comfyui/models/vae   # opcional, por si necesitas VAE separado

# Modelo 1: DreamShaper 8 (ya lo tenías)
RUN curl -L -o /comfyui/models/checkpoints/dreamshaper_8.safetensors \
    https://huggingface.co/Lykon/DreamShaper/resolve/main/DreamShaper_8_pruned.safetensors

# Modelo 2: Juggernaut XL Ragnarok (agregado ahora)
# Opción 1: Descarga y renombra directamente al nombre que usa tu workflow
RUN curl -L -o /comfyui/models/checkpoints/juggernautXL_ragnarokBy.safetensors \
    https://huggingface.co/RunDiffusion/Juggernaut-XL-v9/resolve/main/Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors

# Opción alternativa: Si prefieres un mirror con el nombre exacto
# RUN curl -L -o /comfyui/models/checkpoints/juggernautXL_ragnarokBy.safetensors \
#     https://huggingface.co/xxiaogui/hongchao/resolve/main/juggernautXL_ragnarokBy.safetensors

# (Opcional) VAE recomendado para SDXL (mejora mucho la calidad en Juggernaut XL)
# RUN curl -L -o /comfyui/models/vae/sdxl_vae.safetensors \
#     https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors

# Listo. No necesitas más para workflows básicos.
