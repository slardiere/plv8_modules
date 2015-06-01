EXTENSION = plv8_modules
DATA = plv8_modules--0.1.sql
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
