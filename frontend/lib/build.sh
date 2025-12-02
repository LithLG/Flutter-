#!/bin/bash

# Script de build para Flutter Web
# Este script facilita o processo de build para deploy no Netlify

echo "🚀 Iniciando build do Flutter Web..."

# Verificar se Flutter está instalado
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter não encontrado. Por favor, instale o Flutter primeiro."
    echo "   Visite: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Limpar builds anteriores
echo "🧹 Limpando builds anteriores..."
flutter clean

# Obter dependências
echo "📦 Obtendo dependências..."
flutter pub get

# Build para web (produção)
echo "🏗️  Construindo aplicação web..."
flutter build web --release --web-renderer canvaskit

# Verificar se o build foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "✅ Build concluído com sucesso!"
    echo "📁 Arquivos gerados em: build/web/"
    echo ""
    echo "📤 Próximos passos:"
    echo "   1. Faça commit dos arquivos"
    echo "   2. Push para o repositório"
    echo "   3. O Netlify fará o deploy automaticamente"
    echo ""
    echo "   Ou faça deploy manual:"
    echo "   cd build/web && netlify deploy --prod"
else
    echo "❌ Erro no build. Verifique os logs acima."
    exit 1
fi
