$path = "index.html"
$content = [System.IO.File]::ReadAllText($path)

# 1. FIX STARS (Replacing Unicode with Perfect SVG Retro Stars)
$oldStars = @"
      <div class="star s1">?</div><div class="star s2">?</div><div class="star s3">?</div><div class="star s4">?</div>
      <div class="star s5">?</div>
"@
$newStars = @"
      <div class="star s1"></div><div class="star s2"></div><div class="star s3"></div><div class="star s4"></div>
      <div class="star s5"></div>
"@
$content = $content.Replace($oldStars, $newStars)

$oldStarCss = ".star { position: absolute; color: var(--red); font-size: 2rem; animation: floatS 4s ease-in-out infinite; opacity: 0.8; text-shadow: 2px 2px 0px var(--gold); }"
$newStarCss = ".star { position: absolute; width: 2em; height: 2em; animation: floatS 4s ease-in-out infinite; opacity: 0.8; background-size: contain; background-repeat: no-repeat; filter: drop-shadow(2px 2px 0px var(--gold)); }
        .s1,.s3,.s5 { background-image: url('data:image/svg+xml;utf8,<svg fill=""%23E85D22"" viewBox=""0 0 24 24"" xmlns=""http://www.w3.org/2000/svg""><path d=""M12 0L14.59 9.41L24 12L14.59 14.59L12 24L9.41 14.59L0 12L9.41 9.41L12 0Z""/></svg>'); }
        .s2,.s4 { background-image: url('data:image/svg+xml;utf8,<svg fill=""%23C83000"" viewBox=""0 0 24 24"" xmlns=""http://www.w3.org/2000/svg""><path d=""M12 0L14.59 9.41L24 12L14.59 14.59L12 24L9.41 14.59L0 12L9.41 9.41L12 0Z""/></svg>'); }"
$content = $content.Replace($oldStarCss, $newStarCss)

# 2. REMOVE WHITE BACKGROUND FROM BURGERS using Multiply Blend
$content = $content.Replace("z-index:2; transition: opacity 0.4s", "z-index:2; mix-blend-mode: multiply; transition: opacity 0.4s")
$content = $content.Replace("z-index:1; opacity:0; transition: opacity 0.4s", "z-index:1; opacity:0; mix-blend-mode: multiply; transition: opacity 0.4s")

# 3. INTERSECTION OBSERVER CSS 
$oldHoverCss = @"
        <style>
          .burger-real-wrap:hover .burger-closed { opacity:0 !important; transform:translate(-50%, -50%) scale(1.05) !important; }
          .burger-real-wrap:hover .burger-open { opacity:1 !important; transform:translate(-50%, -50%) scale(1) !important; }
        </style>
"@
$newHoverCss = @"
        <style>
          .burger-real-wrap:hover .burger-closed, .burger-real-wrap.mobile-hover .burger-closed { opacity:0 !important; transform:translate(-50%, -50%) scale(1.05) !important; }
          .burger-real-wrap:hover .burger-open, .burger-real-wrap.mobile-hover .burger-open { opacity:1 !important; transform:translate(-50%, -50%) scale(1) !important; }
        </style>
"@
$content = $content.Replace($oldHoverCss, $newHoverCss)

# 4. JS FOR MOBILE HOVER SCROLL TRIGGER
$scriptJS = @"
<script>
document.addEventListener('DOMContentLoaded', () => {
    const wrap = document.querySelector('.burger-real-wrap');
    if(wrap && 'IntersectionObserver' in window) {
        const obs = new IntersectionObserver((entries) => {
            entries.forEach(e => {
                if(e.isIntersecting) {
                    wrap.classList.add('mobile-hover');
                } else {
                    wrap.classList.remove('mobile-hover');
                }
            });
        }, { threshold: 0.6 });
        obs.observe(wrap);
    }
});
</script>
</body>
"@
if (-not $content.Contains("mobile-hover")) {
    $content = $content.Replace("</body>", $scriptJS)
}

[System.IO.File]::WriteAllText($path, $content)
