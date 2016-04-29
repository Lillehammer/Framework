UPDATE = git pull origin master

PUSH = $(UPDATE) && git add -A && git commit -a && git push origin master

all: update

update:
	cd ../Deployment && $(UPDATE)
	cd ../Mission && $(UPDATE)
	cd ../Mapping && $(UPDATE)
	cd ../Texturing && $(UPDATE)
	cd ../Upstream && $(UPDATE)
	cd ../Framework && $(UPDATE)
	cd ../Sounds && $(UPDATE)
	cd ../Economy && $(UPDATE)
	cd ../Lillehammer.github.io && $(UPDATE)

push:
	cd ../Deployment && $(PUSH); echo
	cd ../Mission && $(PUSH); echo
	cd ../Mapping && $(PUSH); echo
	cd ../Texturing && $(PUSH); echo
	cd ../Upstream && $(PUSH); echo
	cd ../Framework && $(PUSH); echo
	cd ../Sounds && $(PUSH); echo
	cd ../Economy && $(PUSH); echo
	cd ../Lillehammer.github.io && $(PUSH); echo

