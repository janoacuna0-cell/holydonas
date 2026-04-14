$path = "index.html"
$content = [System.IO.File]::ReadAllText($path)

# 1. REMOVE REVIEWS SECTION
$startRev = $content.IndexOf("<!-- REVIEWS -->")
$endRev = $content.IndexOf("<!-- CTA -->")
if ($startRev -ge 0 -and $endRev -gt $startRev) {
    $content = $content.Substring(0, $startRev) + $content.Substring($endRev)
}

# Remove links
$content = $content.Replace('<li><a href="#reviews">Reviews</a></li>', "")
$content = $content.Replace('<a href="#reviews" onclick="cDr()">Reviews</a>', "")

# 2. OVERLAPPING CTA TEXT
$oldCtaBefore = ".cta-sec::before{content:""HOLY DONA'S"";position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-family:var(--font-d);font-size:24vw;color:var(--bg2);pointer-events:none;white-space:nowrap;}"
$newCtaBefore = ".cta-sec::before{content:""HOLY DONA'S"";position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-family:var(--font-d);font-size:12vw;color:var(--orange);opacity:0.1;pointer-events:none;white-space:nowrap;}"
$content = $content.Replace($oldCtaBefore, $newCtaBefore)

# 3. REALISTIC BURGER TOGGLE
$startExp = $content.IndexOf("<!-- EXPLODED BURGER HERE -->")
$endExp = $content.IndexOf("<!-- TEXT -->")
if ($startExp -ge 0 -and $endExp -gt $startExp) {
    $realisticBurger = @"
<!-- EXPLODED BURGER HERE -->
    <div class="reveal">
      <div class="burger-real-wrap" style="position:relative; width:100%; max-width:460px; height:460px; margin:0 auto; cursor:pointer;">
        <!-- Burger Closed -->
        <img src="burger_closed.png.png" class="burger-closed" alt="Holy Dona's Burger" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); width:100%; height:auto; z-index:2; transition: opacity 0.4s var(--ease), transform 0.4s var(--ease);" />
        <!-- Burger Open -->
        <img src="burger_open.png.png" class="burger-open" alt="Holy Dona's Burger Interior" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%) scale(0.95); width:100%; height:auto; z-index:1; opacity:0; transition: opacity 0.4s var(--ease), transform 0.4s var(--ease);" />
        
        <style>
          .burger-real-wrap:hover .burger-closed { opacity:0 !important; transform:translate(-50%, -50%) scale(1.05) !important; }
          .burger-real-wrap:hover .burger-open { opacity:1 !important; transform:translate(-50%, -50%) scale(1) !important; }
        </style>
      </div>
      <div class="exp-hint" style="opacity:1; text-align:center;font-size:0.8rem;font-weight:bold;letter-spacing:1px;text-transform:uppercase;color:var(--orange);margin-top:20px;">PASA EL CURSOR PARA ABRIR</div>
    </div>
"@
    $content = $content.Substring(0, $startExp) + $realisticBurger + $content.Substring($endExp)
}

# 4. HERO STARS AND COLOR (Animated Sunburst)
$startHeroParticles = $content.IndexOf('<div class="hero-particles" id="heroParticles"></div>')
if ($startHeroParticles -ge 0) {
    $heroStars = @"
<div class="retro-stars">
      <div class="star s1">?</div><div class="star s2">?</div><div class="star s3">?</div><div class="star s4">?</div>
      <div class="star s5">?</div>
      <style>
        .retro-stars { position: absolute; inset: 0; pointer-events: none; z-index: 1; overflow: hidden; }
        .star { position: absolute; color: var(--red); font-size: 2rem; animation: floatS 4s ease-in-out infinite; opacity: 0.8; text-shadow: 2px 2px 0px var(--gold); }
        .s1 { top: 20%; left: 10%; font-size: 3rem; animation-delay: 0s; color: var(--orange); }
        .s2 { top: 15%; right: 15%; font-size: 2.5rem; animation-delay: 1s; color: var(--red); }
        .s3 { bottom: 25%; left: 20%; font-size: 4rem; animation-delay: 2s; color: var(--gold); }
        .s4 { bottom: 30%; right: 10%; font-size: 2rem; animation-delay: 1.5s; color: var(--orange); }
        .s5 { top: 50%; left: 5%; font-size: 1.5rem; animation-delay: 2.5s; color: var(--red); }
        @keyframes floatS { 0%, 100% { transform: translateY(0) rotate(0deg) scale(1); } 50% { transform: translateY(-20px) rotate(15deg) scale(1.1); } }
        #hero { background: repeating-conic-gradient(var(--bg) 0 15deg, var(--bg3) 15deg 30deg) !important; }
      </style>
  </div>
"@
    $content = $content.Replace('<div class="hero-particles" id="heroParticles"></div>', $heroStars)
}

[System.IO.File]::WriteAllText($path, $content)
