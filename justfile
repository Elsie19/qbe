default: check docs run

check:
    v -check -skip-unused src/main.v -q

docs:
    v doc -m -readme -f html . -o docs/

run:
    v -skip-unused run src/main.v
