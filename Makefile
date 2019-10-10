.PHONY: pull-upstream
pull-upstream:
	git checkout upstream_master
	git pull
	git checkout master
	git merge --no-edit upstream_master
