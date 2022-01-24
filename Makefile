

all: firsttime
	./run.bash

firsttime: layerkind_query.bash

layerkind_query.bash:
	./build.bash ..

clean:
	rm -f layer*.bash
	rm -f preprocessed*
	rm -f out.json
	rm -f view*.bash view*.pl view*.js

