sync:
	git pull origin master

update:
	git add .
	git commit -m "update post"
	git push

deploy:
	hexo clean
	hexo g
	hexo d