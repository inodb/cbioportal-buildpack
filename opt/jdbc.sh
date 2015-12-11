if [ -n "$CLEARDB_DATABASE_URL" ]; then
    jdbc_protocol="jdbc:mysql"
    db_user=$(expr "$db_url" : "${db_protocol}://\(.\+\):\(.\+\)@")
    db_prefix="${db_protocol}://${db_user}:"

    db_pass=$(expr "$db_url" : "${db_prefix}\(.\+\)@")
    db_prefix="${db_prefix}${db_pass}@"

    db_host_port=$(expr "$db_url" : "${db_prefix}\(.\+\)/")
    db_prefix="${db_prefix}${db_host_port}/"

    db_suffix=$(expr "$db_url" : "${db_prefix}\(.\+\)")

    export JDBC_DATABASE_URL="${jdbc_protocol}://${db_host_port}/${db_suffix}"
    export JDBC_DATABASE_USERNAME="${db_user}"
    export JDBC_DATABASE_PASSWORD="${db_pass}"
fi
