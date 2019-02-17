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
