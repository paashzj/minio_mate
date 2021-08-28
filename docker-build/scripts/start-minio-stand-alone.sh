#!/bin/bash

nohup minio server $MINIO_HOME/data >$MINIO_HOME/minio.log 2>$MINIO_HOME/minio_error.log &