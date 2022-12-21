from kinds import StrAnyDict
from kinds.dicts import strany_function


def test_strany_function():
    """Test type StrAnyDict."""
    tparam: StrAnyDict = {"bool": True, "int": 69, "str": "string"}
    assert strany_function(tparam)


def test_strany_function_fail():
    """Test strany_function fails."""
    tparam: StrAnyDict = {"int": 69, "str": "string"}
    assert not strany_function(tparam)
