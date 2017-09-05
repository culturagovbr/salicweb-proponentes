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
pip3 install -r requirements.txt
```

5. Popule o banco

A aplicação não permite adição ou remoção de usuários, portanto é importante popular a base de testes manualmente, há um script para isso no trello do projeto

6. Rode as migrations do python admin

Vá até a pasta do projeto e execute o migrate (para criar e popular as tabelas default do django-admin
```
python manage.py migrate
```

7. Crie o super admin no python
```
python manage.py createsuperuser
```

8. Bote pra rodar

Navegue para a pasta do projeto com o ambiente virtual ativado e rode o runserver
```
python manage.py runserver
```

Acesse o serviço no [localhost:8000](http://localhost:8000)

