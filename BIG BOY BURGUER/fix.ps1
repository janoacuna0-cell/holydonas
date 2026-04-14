$path = "c:\Users\janoa\OneDrive\Desktop\BIG BOY BURGUER\index.html"
$content = [System.IO.File]::ReadAllText($path)

# Replace all cursor:none with cursor:pointer
$content = $content.Replace("cursor:none;", "cursor:pointer;")

# Fix body back to default
$content = $content.Replace("overflow-x:hidden;cursor:pointer;}", "overflow-x:hidden;cursor:default;}")

# Hide cursor elements
$content = $content.Replace("#cur-dot{position:fixed;", "#cur-dot{display:none !important;position:fixed;")
$content = $content.Replace("#cur-ring{position:fixed;", "#cur-ring{display:none !important;position:fixed;")

# Hide mascot (bottom right floating logo)
$content = $content.Replace("#mascot{position:fixed;", "#mascot{display:none !important;position:fixed;")

[System.IO.File]::WriteAllText($path, $content)
