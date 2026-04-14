$path = "index.html"
$content = [System.IO.File]::ReadAllText($path)

# Text replacements
$content = $content.Replace("Big Boy Burgers", "Holy Dona's")
$content = $content.Replace("BIG BOY BURGERS", "HOLY DONA'S")
$content = $content.Replace("BIG BOY<br/>BURGERS", "HOLY<br/>DONA'S")
$content = $content.Replace("BIG BOY", "HOLY DONA'S")
$content = $content.Replace("Big Boy", "Holy Dona's")
$content = $content.Replace("La Real BIG Burger", "Burgers Since 2023")
$content = $content.Replace("La real <em>BIG</em> burger", "Burgers <em>SINCE</em> 2023")
$content = $content.Replace("LA REAL BIG BURGER", "BURGERS SINCE 2023")

# Phone number replacements
$content = $content.Replace("512-0088", "457-7989")
$content = $content.Replace("5120088", "4577989")

# WhatsApp message replacement
$content = $content.Replace("Hola%20Big%20Boy", "Hola%20Holy%20Donas")

# CSS replacements (warm, creamy aesthetic)
$content = $content.Replace("--orange:#FF6B1A", "--orange:#E85D22")
$content = $content.Replace("--red:#D93A1A", "--red:#C83000")
$content = $content.Replace("--gold:#F5A623", "--gold:#FFB30F")
$content = $content.Replace("--white:#F5F0E8", "--white:#FFF5D1")
$content = $content.Replace("--bg:#080808;--bg2:#0f0f0f;--bg3:#161616", "--bg:#1A0F0A;--bg2:#24140D;--bg3:#2D1A12")
$content = $content.Replace("--card:#181818", "--card:#20120B")

[System.IO.File]::WriteAllText($path, $content)
