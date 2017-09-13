#!/usr/local/bin/python3
import sys
from notebook.auth.security import set_password
set_password(sys.argv[1])
