# Instruções para Publicar no GitHub Pages

## Passo 1: Instalar Git (se ainda não tiver)

1. Baixe o Git em: https://git-scm.com/download/win
2. Instale seguindo o assistente
3. Abra um novo terminal após a instalação

## Passo 2: Configurar o repositório

Abra o terminal na pasta do projeto e execute os seguintes comandos:

```bash
# Inicializar repositório Git
git init

# Adicionar arquivos ao staging
git add index.html
git add data/*.geojson
git add README.md
git add .gitignore
git add .nojekyll

# Fazer o primeiro commit
git commit -m "Initial commit: WebGIS minimalista"

# Adicionar o repositório remoto do GitHub
git remote add origin https://github.com/Luan-Imbiriba/webgis-treino.git

# Renomear branch para main (se necessário)
git branch -M main

# Enviar arquivos para o GitHub
git push -u origin main
```

## Passo 3: Ativar GitHub Pages

1. Acesse: https://github.com/Luan-Imbiriba/webgis-treino
2. Clique em **Settings** (Configurações)
3. No menu lateral, clique em **Pages**
4. Em **Source**, selecione **Deploy from a branch**
5. Selecione a branch **main** e a pasta **/ (root)**
6. Clique em **Save**

## Passo 4: Acessar seu site

Após alguns minutos, seu site estará disponível em:
**https://luan-imbiriba.github.io/webgis-treino/**

## Notas Importantes

- O arquivo `.nojekyll` foi criado para garantir que o GitHub Pages não processe os arquivos com Jekyll
- Apenas os arquivos `.geojson` da pasta `data/` são necessários (os arquivos `.qmd` são ignorados)
- Os arquivos shapefile na pasta `shp/` não são necessários e foram ignorados

## Atualizar o site

Sempre que fizer alterações, execute:

```bash
git add .
git commit -m "Descrição das alterações"
git push
```

O GitHub Pages atualiza automaticamente em alguns minutos.


