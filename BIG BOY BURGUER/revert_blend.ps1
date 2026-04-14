$path = "index.html"
$content = [System.IO.File]::ReadAllText($path)

$content = $content.Replace("mix-blend-mode: multiply; ", "")

[System.IO.File]::WriteAllText($path, $content)
