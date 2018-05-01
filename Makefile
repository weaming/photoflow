build:
	rm -rf dist && cd src && vue build && cp -r dist ..

publish:
	cd dist && \
		git init && \
		git remote add origin git@github.com:weaming/photoflow.git && \
		git checkout -b gh-pages && \
		echo 'photography.bitsflow.org' > CNAME && \
		git add -A && \
		git commit -m "$$(date +'%Y-%m-%d %X')" && \
		git push -f

all: build publish


.PHONY: build publish all
