# Use uma imagem oficial do Python como imagem base
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala os pacotes necessários definidos em requirements.txt
# --no-cache-dir: Desabilita o cache, o que reduz o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copia o resto do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000 para o mundo fora deste contêiner
EXPOSE 8000

# Executa app.py quando o contêiner for iniciado
# --host 0.0.0.0 é necessário para tornar a aplicação acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]