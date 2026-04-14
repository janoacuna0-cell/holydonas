$path = "index.html"
$content = [System.IO.File]::ReadAllText($path)

$findNav = @"
<nav id="nav">
  <a href="#hero" class="nav-brand">
    <span class="nav-brand-name">HOLY DONA'S</span>
    <span class="nav-brand-tag">Burgers Since 2023</span>
  </a>
"@

$replaceNav = @"
<nav id="nav">
  <a href="#hero" class="nav-brand" style="flex-direction:row; align-items:center; gap:12px;">
    <img src="logo.jpg" alt="Holy Dona's Logo" style="width:45px; height:45px; border-radius:50%; object-fit:cover; display:none;" onload="this.style.display='block'" onerror="this.style.display='none'" />
    <div style="display:flex; flex-direction:column;">
      <span class="nav-brand-name">HOLY DONA'S</span>
      <span class="nav-brand-tag">Burgers Since 2023</span>
    </div>
  </a>
"@
$content = $content.Replace($findNav, $replaceNav)

$findFoot = @"
  <div class="fi">
    <div>
      <div class="flogo">HOLY DONA'S</div>
      <div class="fslogan">Burgers Since 2023</div>
"@

$replaceFoot = @"
  <div class="fi">
    <div>
      <div class="flogo" style="display:flex; align-items:center; gap:12px;">
        <img src="logo.jpg" alt="Logo" style="width:50px; height:50px; border-radius:50%; object-fit:cover; display:none;" onload="this.style.display='block'" onerror="this.style.display='none'" />
        HOLY DONA'S
      </div>
      <div class="fslogan">Burgers Since 2023</div>
"@
$content = $content.Replace($findFoot, $replaceFoot)

[System.IO.File]::WriteAllText($path, $content)
