#!/system/bin/sh
DIR="$HOME/www"
mkdir -p $DIR
while true; do
    FECHA=$(date +%s)
    TEMP_VIDEO="/sdcard/Download/temp_grabacion.mp4"
    screenrecord --size 720x1280 --time-limit 10 --bit-rate 2000000 $TEMP_VIDEO
    if [ -s "$TEMP_VIDEO" ]; then
        mv $TEMP_VIDEO $DIR/live_video.mp4
        echo "<html><head><meta http-equiv='refresh' content='11'></head><body style='background:#000;color:#0f0;text-align:center;'><h2>STREAMING ACTIVO</h2><video width='100%' autoplay muted controls><source src='live_video.mp4?v=$FECHA' type='video/mp4'></video></body></html>" > "$DIR/index.html"
        echo "[OK] Clip actualizado: $FECHA"
    fi
done
