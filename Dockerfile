# Base oficial para ComfyUI en RunPod Serverless
FROM runpod/worker-comfyui:5.5.1-base

# Crear carpeta de checkpoints (por si acaso)
RUN mkdir -p /comfyui/models/checkpoints

# Descarga directa con curl (más estable que comfy model download para serverless)
# Opción 1: Versión oficial pruned (recomendada)
RUN curl -L -o /comfyui/models/checkpoints/dreamshaper_8.safetensors \
    https://huggingface.co/Lykon/DreamShaper/resolve/main/DreamShaper_8_pruned.safetensors

# Opción 2: Si prefieres exactamente la copia de autismanon/modeldump
# (pero usa resolve en vez de blob)
# RUN curl -L -o /comfyui/models/checkpoints/dreamshaper_8.safetensors \
#     https://huggingface.co/autismanon/modeldump/resolve/main/dreamshaper_8.safetensors

# Si quieres renombrar el archivo pruned al nombre exacto que usa tu workflow
# (tu JSON espera "dreamshaper_8.safetensors")
# RUN mv /comfyui/models/checkpoints/DreamShaper_8_pruned.safetensors \
#     /comfyui/models/checkpoints/dreamshaper_8.safetensors

# (Opcional) Si tu workflow necesita un VAE externo, agrégalo aquí también
# RUN mkdir -p /comfyui/models/vae \
#     && curl -L -o /comfyui/models/vae/vae-ft-mse-840000-ema-pruned.safetensors \
#     https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

# No necesitas custom nodes en este workflow básico (todo es nativo)
# Si más adelante agregas nodos custom → ponlos aquí con comfy node install ...

# No copies nada de /runpod-volume → en serverless no existe persistencia
