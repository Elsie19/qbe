default: check docs run

check:
    v -check -skip-unused . -q

docs:
    v doc -m -readme -f html . -o docs/

run:
    v -skip-unused run .
