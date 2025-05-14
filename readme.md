# MAM2

Сборка MOL ["без" боли](https://page.hyoo.ru/#!=icaxzk_7m3n3b)

## bootstrap

```sh
make mam_init
```
- http://localhost:9080/mol/wire/dom/-/test.html

## log

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
