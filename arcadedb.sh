#!/bin/bash

docker run --rm \
	-p "2480:2480" \
	-p "2424:2424" \
	-p "5432:5432" \
	--env ARCADEDB_OPTS_MEMORY="-Xms3G -Xmx3G" \
	--env arcadedb.postgres.debug=true \
	--env arcadedb.server.rootPassword=playwithdata \
	--env "arcadedb.server.defaultDatabases=Imported[root]{import:https://github.com/ArcadeData/arcadedb-datasets/raw/main/orientdb/OpenBeer.gz}" \
	--env arcadedb.server.plugins="Postgres:com.arcadedb.postgres.PostgresProtocolPlugin" \
	arcadedata/arcadedb:latest
