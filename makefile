.PHONY: deploy

deploy: book
	@echo "====> deploying to github"
	rm -rf /tmp/book
	rm -rf .git/worktrees
	git worktree add /tmp/book gh-pages
	mdbook build
	rm -rf /tmp/book/*
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
        git add -A && \
        git commit -m "deployed on $(shell date) by ${USER}" && \
        git push origin gh-pages
	@echo "====> push main begin ..$(pwd)"
	pwd
	    git add . && \
        git commit -m "updated book on $(shell date) by ${USER}" && \
        git push origin main
	git worktree remove /tmp/book
