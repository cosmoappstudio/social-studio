# ffmpeg overlay recipes (proven)

Overlay PNG cards (1920x1080 transparent) on a clip, with fade in/out:
```bash
ffmpeg -y -i in.mp4 -loop 1 -t 3 -i card1.png -loop 1 -t 3 -i card2.png \
 -filter_complex "[1:v]format=rgba,fade=in:st=0:d=0.3:alpha=1,fade=out:st=2.7:d=0.3:alpha=1,setpts=PTS+2/TB[c1];\
[2:v]format=rgba,fade=in:st=0:d=0.3:alpha=1,fade=out:st=2.7:d=0.3:alpha=1,setpts=PTS+8/TB[c2];\
[0:v][c1]overlay=0:0:enable='between(t,2,5)'[a];[a][c2]overlay=0:0:enable='between(t,8,11)'[v]" \
 -map "[v]" -map 0:a? -c:v libx264 -crf 18 -pix_fmt yuv420p -af "afade=out:st=END-1:d=1" out.mp4
```
Vertical 9:16 from 16:9: `crop=608:1080:X:0,scale=1080:1920` (pick X so the subject stays in frame), then overlay vertical cards (v_*.png at 1080x1920).
Always render cards with `render.sh card.html card.png 1920 1080 transparent`.
Hook in first 2 s, one idea per card, end card = logo + one line + URL. No upvote asks.
