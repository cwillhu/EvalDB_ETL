""" Test pyInovEval.mssql.Connection """

from pyInovEval.mssql import Connection


def test__01_connection():

    with Connection() as c:
        c.cursor.execute("SELECT tableName FROM tableInfo WHERE tableName = 'tab02'")
        res = c.cursor.fetchone()

    assert res[0] == 'tab02'
