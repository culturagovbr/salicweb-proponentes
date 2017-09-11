# salicweb
Edição dos proponentes do salicweb para recuperação de acesso

## instalação local

1. database

localmente estamos usando um container postgres do projeto salic
```
docker run --name db-postgres -p 5432:5432 -e POSTGRES_PASSWORD=root -e POSTGRES_USER=postgres -e PGDATA=/var/lib/postgresql/data -v /home/chris/postgres-container/db/postgresql/data:/var/www/project/db/data -d culturagovbr/salic-db
```

2. instalar o projeto

Clone o projeto e crie um ambiente virtual

```
virtualenv salicweb-proponentes-venv
```

3. Ative o ambiente virtual
```
source salicweb-proponentes-venv/bin/activate 
```

4. Instale as dependências do projeto
```
pip install -r requirements.txt
```

5. Rode as migrations do python admin

Vá até a pasta do projeto e execute o migrate (para criar e popular as tabelas default do django-admin
```
python manage.py migrate
```

6. Crie o super admin no python
```
python manage.py createsuperuser
```

7. Instale o backend para falar com o SQLSERVER
```
pip install django-pyodbc-azure
```

8. Instale o pacote dev odbc
```
sudo apt-get install unixodbc-dev
```

9. Instale o driver TDS que o backend vai usar
```
sudo apt-get install tdsodbc
```

10. Declare o driver editando o conteúdo do arquivo /etc/odbcinst.ini

Caso já não tenha sido criado, crie o arquivo e insira o texto abaixo nele
```
[FreeTDS]
Description = TDS Driver for MSSQL
driver = /usr/lib/x86_64-linux-gnu/odbc/libtdsodbc.so
setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so
```

11. Configure as variáveis de ambiente das configurações

Declare essas variáveis para informar os dados do Banco:
```
$DBNAME
$DBUSER
$DBPASS
$DBHOST
$DBPORT
```

12. Bote pra rodar

Navegue para a pasta do projeto com o ambiente virtual ativado e rode o runserver
```
python manage.py runserver
```

13. Ou construa e rode sua imagem docker
```
docker build . -t salicweb-proponentes
docker run -it --name salicweb-proponentes -p 80:8000 -e DBNAME=$DBNAME -e DBUSER=$DBUSER -e DBPASS=$DBPASS -e DBHOST=$DBHOST -e DBPORT=$DBPORT salicweb-proponentes
```

14. acesse a interface de admin local :D
User
Admin
Pass
123456

Acesse o serviço no [localhost:8000/admin](http://localhost:8000/admin)

