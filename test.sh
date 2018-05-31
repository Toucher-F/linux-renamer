#!/bin/bash

sudo dos2unix /src/linux-renamer/*
bash /src/linux-renamer/create.sh
bash /src/linux-renamer/rename.sh
