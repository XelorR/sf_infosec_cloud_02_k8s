# Kubernates using Minikube

Homework for SF/MIFI infosec courses

Здесь два рабочих премера:

- [предоставленный на курсе](./sf_example) (запускал чтобы понять как оно запускается)
- [мой кластер](./my), согласно заданию

## The task

### Разверните [аналогичное](sf_example) веб-приложение на кластере Minikube. 

1. В качестве образов для двух контейнеров можно (но не обязательно) использовать уже созданные нами в модулях по Docker образы. Единственное отличие от приведённого примера — наши образы не представлены в публичном репозитории, поэтому их нужно вручную загрузить внутрь кластера:
```bash
minikube cache add <название локального образа>
```
2. Кроме того, файл index.php нужно чуть переписать, т. к. у нас адрес до БД и логин/пароль прописаны статически в самом файле. А должны браться из переменных окружения.
3. Если используете публичные образы, проследите, чтобы образ веб-приложения брал данные для подключения к БД из переменных окружения. **Использовать уже приведённые образы запрещено.**

4. Помимо этого, необходимо сделать таблицу (например, в формате Excel) с инвентаризацией вашего кластера. В кратком виде указать установленное ПО на нодах, количество нод, ОС на нодах, адреса.

### Условия реализации

В качестве ответа предоставьте:

- [ ] все конфигурационные файлы,
- [ ] скриншот из браузера с работающим веб-приложением,
- [ ] вывод команды kubectl get all -o wide,
- [ ] табличку с инвентаризацией.

[Моя папка с конфигами](./my)

Результаты работы загрузите на свой GitHub. В качестве ответа приложите ссылку на репозиторий.

