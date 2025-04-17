#%% Libraries
import os
import pandas as pd                    # Biblioteca para manipulação de dados em DataFrames
from sqlalchemy import create_engine  # Para criar a conexão com o banco de dados via SQLAlchemy
from getpass import getpass           # Para digitar a senha de forma segura (sem exibir na tela)
import os                             # Para manipulação de diretórios e arquivos

# %% Variáveis
base = os.getcwd()                    # Captura o diretório atual de execução do script
path_tables = os.path.join(base, 'tables')  # Caminho da pasta onde estão os arquivos .csv
tables = os.listdir(path_tables)     # Lista todos os arquivos na pasta 'tables'
password = getpass('Database password:')  # Solicita a senha do banco de dados ao usuário

# %% Criação da conexão com o banco de dados PostgreSQL
con = create_engine(f'postgresql+psycopg2://postgres:postgres@localhost:5432/postgres')
# Obs: Aqui a senha não está sendo usada, mesmo tendo sido solicitada acima com `getpass`.

# %% Upload das tabelas CSV para o banco de dados
for table in tables:
    path_table = os.path.join(path_tables, table)  # Caminho completo para o arquivo CSV
    table = table.replace('.csv', '')              # Remove a extensão .csv para usar como nome da tabela
    df = pd.read_csv(path_table)                   # Lê o conteúdo do CSV em um DataFrame
    df.to_sql(
        table, con, schema='bronze',               # Envia o DataFrame para o banco, no schema "bronze"
        if_exists='replace', index=False           # Substitui a tabela se ela já existir, e não inclui o índice
    )
    print(f'Table {table} uploaded!')              # Confirma que a tabela foi enviada com sucesso

# %%
