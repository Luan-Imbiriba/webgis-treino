# Script para fazer upload dos arquivos para o GitHub
# Execute este script no PowerShell

Write-Host "=== Upload para GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Verificar se Git está instalado
try {
    $gitVersion = git --version
    Write-Host "✓ Git encontrado: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git não está instalado!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Por favor, instale o Git primeiro:" -ForegroundColor Yellow
    Write-Host "https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Ou siga as instruções manuais em: INSTRUCOES_GITHUB.md" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Inicializando repositório Git..." -ForegroundColor Cyan

# Verificar se já é um repositório Git
if (Test-Path .git) {
    Write-Host "✓ Repositório Git já inicializado" -ForegroundColor Green
} else {
    git init
    Write-Host "✓ Repositório Git inicializado" -ForegroundColor Green
}

Write-Host ""
Write-Host "Adicionando arquivos..." -ForegroundColor Cyan

# Adicionar arquivos necessários
git add index.html
git add data/*.geojson
git add README.md
git add .gitignore
git add .nojekyll

Write-Host "✓ Arquivos adicionados" -ForegroundColor Green

Write-Host ""
Write-Host "Fazendo commit..." -ForegroundColor Cyan

# Verificar se há mudanças para commitar
$status = git status --porcelain
if ($status) {
    git commit -m "Initial commit: WebGIS minimalista"
    Write-Host "✓ Commit realizado" -ForegroundColor Green
} else {
    Write-Host "ℹ Nenhuma mudança para commitar" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Configurando repositório remoto..." -ForegroundColor Cyan

# Verificar se o remote já existe
$remote = git remote get-url origin 2>$null
if ($remote) {
    Write-Host "✓ Remote já configurado: $remote" -ForegroundColor Green
} else {
    git remote add origin https://github.com/Luan-Imbiriba/webgis-treino.git
    Write-Host "✓ Remote configurado" -ForegroundColor Green
}

Write-Host ""
Write-Host "Renomeando branch para main..." -ForegroundColor Cyan
git branch -M main 2>$null
Write-Host "✓ Branch configurada" -ForegroundColor Green

Write-Host ""
Write-Host "=== Próximos passos ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Execute o comando para fazer push:" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "2. Se for a primeira vez, você precisará autenticar no GitHub" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Depois, ative o GitHub Pages:" -ForegroundColor Yellow
Write-Host "   - Acesse: https://github.com/Luan-Imbiriba/webgis-treino/settings/pages" -ForegroundColor White
Write-Host "   - Selecione 'Deploy from a branch'" -ForegroundColor White
Write-Host "   - Escolha branch 'main' e pasta '/ (root)'" -ForegroundColor White
Write-Host "   - Clique em 'Save'" -ForegroundColor White
Write-Host ""
Write-Host "4. Seu site estará disponível em:" -ForegroundColor Yellow
Write-Host "   https://luan-imbiriba.github.io/webgis-treino/" -ForegroundColor Green
Write-Host ""


