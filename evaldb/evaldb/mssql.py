''' Connection to SQL Server database '''

import pyodbc, logging, os
from pyInovEval.logger import logger
from pyInovEval.config.config import Config


# Build pyodbc connection string
_pyodbc_conn_str = \
    f"DRIVER={Config.get('dbDriver')};" \
    + f"SERVER={Config.get('dbHost')};" \
    + f"PORT={Config.get('dbPort')};" \
    + f"DATABASE={Config.get('dbName')};" \
    + "trusted_connection=yes"


class Connection():
    """ Connect to SQL Server, with clean up """

    def __enter__(self):
        self.conn = pyodbc.connect(_pyodbc_conn_str)
        self.conn.autocommit = True
        self.cursor = self.conn.cursor()
        return self

    def execute(self, command):
        self.cursor.execute(command)
        
    def __exit__(self, exc_type, exc_val, exc_tb):
        self.conn.close()

