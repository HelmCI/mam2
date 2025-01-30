MAM_JS = node.js
MAM_NODE_MODULES = node_modules/mam/$(MAM_JS)
MAM_MOL = mol/build/-/$(MAM_JS)
MAM_FIX = mam_fix/mam.js

mam_node_modules_fix_append:
	cat $(MAM_FIX) >> $(MAM_NODE_MODULES)
mam_node_modules_fix_check:
	tail $(MAM_NODE_MODULES)

mam_mol_fix_append:
	cat $(MAM_FIX) >> $(MAM_MOL)
mam_mol_fix_check:
	tail $(MAM_MOL)

mam_clean:
	fd -It d '^-' -X rm -rf
	rm -rf node_modules
	rm -rf mol/icon
mam_install: mam_clean
	ln -s ../mol_icon mol/icon
	npm install
	make mam_node_modules_fix_append
	npm run mam2
	make mam_mol_fix_append
	node ./gd/snap.npm/cli.mjs gd/demo/app
	npm start
