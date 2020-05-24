mkdir processed
mkdir palette
for %%F in (*.gif) do (

    ffmpeg -y -i %%F -vf palettegen palette/%%F.png 
    ffmpeg -y -i %%F -i palette/%%F.png -filter_complex paletteuse -r 10 -s 150*150 processed/%%F"
)