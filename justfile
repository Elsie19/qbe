default: check docs run

check:
    v -check src/main.v -q

docs:
    v doc -m -readme -f html . -o docs/

run:
    v run src/main.v
