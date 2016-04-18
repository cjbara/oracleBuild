all: build

.phony: build
build:
	./build_db.sh

.phony: tables
tables:
	cd create; echo "exit" | sqlplus guest/guest @create_all; cd ..;

.phony: data
data:
	cd insert; ./insert_all.sh; cd ..;

.phony: packages
packages: pack

.phony: pack
pack:
	cd packages; echo "exit" | sqlplus guest/guest @create_all; cd ..;

.phony: clean
clean:
	rm ./insert/*.log ./insert/*.bad
