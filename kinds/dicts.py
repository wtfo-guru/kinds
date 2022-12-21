"""Top-level module for kinds."""

from kinds import StrAnyDict


def strany_function(sad: StrAnyDict) -> bool:
    """
    We use this function to verify our StrAnyDict type.

    This is how you can write a doctest:

    .. code:: python

        >>> strany_function({"bool": True, "int": 69, "str": "string"})
        True

    Enjoy!
    """
    if isinstance(sad.get("bool"), bool):
        if isinstance(sad.get("int"), int):
            if isinstance(sad.get("str"), str):
                return True
    return False
