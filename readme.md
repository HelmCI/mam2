# MAM2

Сборка MOL ["без" боли](https://page.hyoo.ru/#!=icaxzk_7m3n3b)

## bootstrap

```sh
make mam_init
```
- http://localhost:9080/mol/wire/dom/-/test.html

## Для адоптации к вашему проекту нужно:

- разобраться с каждой строчкой кода, его немного, начните с [Makefile](Makefile)
- укажите свои параметры в [.env](.env), например ваш [Harbor](https://goharbor.io/) для **REG**
- расположите ваш код в нужные **NS**, здесь представлен пример для имен, начинающихся с **g**
- раскоментарьте код сборки в [Dockerfile](Dockerfile) и исправьте под вашу специфику
  - тут сердце и цель этого проекта:
    - версионированная сборка с полной фиксацией окружения до начала сборки, соответственно повторные сборки не будут зависеть от чужих изменений и можно спокойно фиксить и дорабатывать код без необходимости постоянной предварительной адоптации под изменчивый мир
    - мультистейдж сборка для минимизации результирующего образа и эффективного кэширования
    - мультиплатформенная сборка, оптимизированная для максимальной скорости сборки с учетом кэширования и поддержки разных целевых архитектур сервиса
    - мультибилд сборка, сборщик будет максимально эффективно использовать разные архитектуры своего хоста
    - помедитируйте над [.dockerignore](.dockerignore) до полного просветления
- изучите [docker.mk](.ci/make/docker.mk), укажите нужные переменные и протеструйте `make build`
- подключите к своему CI на примере GitLab:
  - раскоментарьте [импорты](.gitlab-ci.yml)
  - удалите [такие примеры приложений](.ci/app/lk.ci.yml) и добавьте свои
  - отредактируйте [правила запуска](.ci/_rules.ci.yml)

## Как было собрано:

```sh
git submodule add --depth 1 -- https://github.com/hyoo-ru/mam.git
git submodule add --depth 1 -- https://github.com/hyoo-ru/mam_mol.git mol
git submodule add --depth 1 -- https://github.com/hyoo-ru/mam_node.git node
git submodule add --depth 1 -- https://github.com/nin-jin/mol_icon.git mol_icon

ln -s mam/package.json
ln -s mam/tsconfig.json
ln -s mam/mam.jam.js
ln -s mam/mam.ts
ln -s mam/.meta.tree

ln -s mam/meta.lang.tree
ln -s mam/lang.lang.tree
ln -s mam/.editorconfig
ln -s mam/.vscode
ln -s mam/tsfmt.json
ln -s mam/.prettierrc.json
```

## TODO:

- [x] Отключить ошибку обновления сабмодулей.
- [x] Сделать опциональное отключение запуска Git.
- [ ] Добавить поддержку файла .meta.loc.tree.
