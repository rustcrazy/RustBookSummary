.PHONY: all clean

#设置默认目标
all: build

# 清除之前生成的文件
clean:
	   rm -rf book
	   rm -rf docs

# 生成HTML文件并复制到docs文件夹
build:
	    mdbook build
	    cp -r book/* docs/

# 提交更改到main分支
commit-main:
	git add src
	#git add README.md
	#git add book.toml
	#git add .gitignore
	git add --all -- :!book
	git commit -m "Update book"
	git push origin main

# 提交更改到gh-pages分支
commit-gh-pages:
	git add docs/
	git commit -m "Update book"
	git push origin gh-pages

# 完整发布流程
publish: build commit-main commit-gh-pages