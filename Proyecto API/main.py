#%%
import spotipy
#%%
from src import api_spotify_soporte as api
# %%
import os
from dotenv import load_dotenv
load_dotenv("/Users/lydiafrailemartin/Desktop/ejercicios adalab/Proyecto API/src/.env")
# %%
sp = api.credenciales()
# %%
uri_playlist = api.preparamos_url("https://open.spotify.com/playlist/2Nwhjsc3IuvTMaUNK3VfL8?si=fb996c1e9c984259")
# %%
uri_playlist
# %%
resultado_api=api.extraer_canciones(sp,uri_playlist)
# %%
resultado_api #* = all_data
# %%
df=api.limpiar_datos(resultado_api)
# %%
df.head()
# %%
api.sacar_caracteristicas(df,sp)
# %%
