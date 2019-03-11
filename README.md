# xtalf_microservices
xtalf microservices repository

# HW № 13

 - [ ] Основное ДЗ
 - [ ] Задание со *. Parker-ом формируется образ с установленным Docker, провиженинг осуществляется с помощью ansible. С помощью Terraform поднимается нужное количество инстансов (их количество задается переменной) и создается правила фаервола для доступа к приложению. Плебуками ansible с динамическим инвентари на поднятых инстансах устанавливается docker,  скачивается нужный image и из него запускается контейнер.

## В процессе сделано:
 - Создан новый проект docker в GCP
 - С помощью gcloud был сформирован файл с ауентификационными данными
 - Установлен docker-machine
 - на локальной машине инициализировано окружение для работу с облачным хостом, с помощью docker-machine в GCP был создан создан хост и на него установлен docker engine
 - были созданы Dockerfile, и скрипт start.sh для запуска приложения. С помощью этого подготовлен образ нашим приложением и образ выгружен в Docker Hub

# HW 14

 - [ ] Основное ДЗ
 - [ ] Задание со *.
1. Нужно передать переменные окружение, соответсвующие новым сетевым алиасам, при запуске контейнеров. Запуск контейнеров с новыми сетевыми алиасами, и передаем новые значения через параметр -e:
   docker run -d --network=reddit --network-alias=new_post_db --network-alias=new_comment_db mongo:latest
   docker run -d --network=reddit --network-alias=new_post -e POST_DATABASE_HOST=new_post_db xtalf/post:1.0
   docker run -d --network=reddit --network-alias=new_comment -e COMMENT_DATABASE_HOST=new_comment_db xtalf/comment:1.0
   docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST=new_post -e COMMENT_SERVICE_HOST=new_comment xtalf/ui:1.0
2. Собраны образы comment,post, ui на основе образа Alpine Linux

# HW 15

Рассмотрены разные виды поддерживаемых docker сетей. Запустили проект Reddit в одной сети bridge, и в разных сетях bridge.
Установили docker-compose на локальную машину. Собрали образы приложения reddit с помощью docker-compose. Запустили приложение reddit с помощью docker-compose в одной сети, и в разных bridge сетях.

Имя проекта по умолчанию - это базовое имя каталога проекта. Для запуска со своим префексом:
docker-compose -p my_prefix up -d
или установить переменную среды COMPOSE_PROJECT_NAME.

# HW 16

В процессе работы была подготовлена инсталляция Gitlab CI. Подготовлен репозиторий с кодом приложения. Был описан пайплайн. И были определены различные окружения.

# HW 17
https://hub.docker.com/u/xtalf

git clone https://github.com/percona/mongodb_exporter.git
cd mongodb_exporter/
make docker
mongodb-exporter:master
export MONGODB_URI='mongodb://localhost:27017'
 http://:9216/metrics
 