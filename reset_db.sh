#!/bin/bash

img_path="app/mytrack/static/img/db"

rm $img_path/*
cd sql
mysql -u mytrack mytrack -pfuckohio < tbl_create.sql
echo "schema updated"
mysql -u mytrack mytrack -pfuckohio < load_data.sql
echo "data loaded"
