# ══════════════════════════════════════════════════════════════════
# Sem 6 Notes - Justfile
# ══════════════════════════════════════════════════════════════════

# Variables
pdf_dir := "pdfs"

# ──────────────────────────────────────────────────────────────────
# Default: compile all .typ files
# ──────────────────────────────────────────────────────────────────
default: compile-all

# ──────────────────────────────────────────────────────────────────
# Install typst if not already installed
# ──────────────────────────────────────────────────────────────────
[unix]
install-typst:
    #!/usr/bin/env sh
    if command -v typst > /dev/null 2>&1; then
        echo "✓ typst is already installed: $(typst --version)"
    else
        echo "Installing typst via Homebrew..."
        brew install typst
        echo "✓ typst installed successfully"
    fi

[windows]
install-typst:
    #!powershell
    if (Get-Command typst -ErrorAction SilentlyContinue) {
        Write-Host "✓ typst is already installed"
        typst --version
    } else {
        Write-Host "Installing typst via winget..."
        winget install --id Typst.Typst
        Write-Host "✓ typst installed successfully"
    }

# ──────────────────────────────────────────────────────────────────
# Compile a specific subject folder
# Usage: just compile "Special Functions"
# ──────────────────────────────────────────────────────────────────
[unix]
compile folder: install-typst
    #!/usr/bin/env sh
    stem=$(echo "{{folder}}" | tr ' ' '-')
    echo "Compiling {{folder}}..."
    typst c "{{folder}}/${stem}.typ" "{{pdf_dir}}/${stem}.pdf" --root . -f pdf
    echo "✓ Output: {{pdf_dir}}/${stem}.pdf"

[windows]
compile folder: install-typst
    #!powershell
    $stem = "{{folder}}" -replace ' ', '-'
    Write-Host "Compiling {{folder}}..."
    typst c "{{folder}}\$stem.typ" "{{pdf_dir}}\$stem.pdf" --root . -f pdf
    Write-Host "✓ Output: {{pdf_dir}}\$stem.pdf"

# ──────────────────────────────────────────────────────────────────
# Compile all .typ files
# ──────────────────────────────────────────────────────────────────
[unix]
compile-all: install-typst
    #!/usr/bin/env sh
    echo "Compiling all subjects..."
    echo ""
    for folder in "Game Theory Applications" "Ordinary Differential Equations" "Special Functions"; do
        stem=$(echo "$folder" | tr ' ' '-')
        echo "→ Compiling $folder..."
        typst c "$folder/${stem}.typ" "{{pdf_dir}}/${stem}.pdf" --root . -f pdf
        echo "  ✓ {{pdf_dir}}/${stem}.pdf"
        echo ""
    done
    echo "All subjects compiled successfully!"

[windows]
compile-all: install-typst
    #!powershell
    $folders = @("Game Theory Applications", "Ordinary Differential Equations", "Special Functions")
    Write-Host "Compiling all subjects...`n"
    foreach ($folder in $folders) {
        $stem = $folder -replace ' ', '-'
        Write-Host "→ Compiling $folder..."
        typst c "$folder\$stem.typ" "{{pdf_dir}}\$stem.pdf" --root . -f pdf
        Write-Host "  ✓ {{pdf_dir}}\$stem.pdf`n"
    }
    Write-Host "All subjects compiled successfully!"

# ──────────────────────────────────────────────────────────────────
# List available subjects
# ──────────────────────────────────────────────────────────────────
list:
    @echo "Available subjects:"
    @echo "  • Game Theory Applications"
    @echo "  • Ordinary Differential Equations"
    @echo "  • Special Functions"
    @echo ""
    @echo "Usage: just compile \"<folder name>\""

# ──────────────────────────────────────────────────────────────────
# Clean all PDFs
# ──────────────────────────────────────────────────────────────────
[unix]
clean:
    #!/usr/bin/env sh
    echo "Cleaning {{pdf_dir}}..."
    rm -f {{pdf_dir}}/*.pdf
    echo "✓ All PDFs removed"

[windows]
clean:
    #!powershell
    Write-Host "Cleaning {{pdf_dir}}..."
    Remove-Item -Path "{{pdf_dir}}\*.pdf" -Force -ErrorAction SilentlyContinue
    Write-Host "✓ All PDFs removed"
