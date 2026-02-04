# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# Instalar curl (necesario porque la base no lo trae)
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Crear carpeta de checkpoints (buena práctica)
RUN mkdir -p /comfyui/models/checkpoints

# Descargar el modelo DreamShaper 8 (versión pruned oficial)
# Renombramos a dreamshaper_8.safetensors para que coincida exactamente con tu workflow
RUN curl -L -o /comfyui/models/checkpoints/dreamshaper_8.safetensors \
    https://huggingface.co/Lykon/DreamShaper/resolve/main/DreamShaper_8_pruned.safetensors

# Opcional: Si quieres la versión exacta de tu mirror original
# RUN curl -L -o /comfyui/models/checkpoints/dreamshaper_8.safetensors \
#     https://huggingface.co/autismanon/modeldump/resolve/main/dreamshaper_8.safetensors

# (Opcional) Si tu workflow necesita un VAE externo explícito
# RUN mkdir -p /comfyui/models/vae && \
#     curl -L -o /comfyui/models/vae/vae-ft-mse-840000-ema-pruned.safetensors \
#     https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

# No necesitas más en este caso (workflow básico sin custom nodes)
