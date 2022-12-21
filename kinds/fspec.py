from pathlib import Path

from kinds import Fspec
from kinds.versioned import unlink_path


def fspec_function(fspec: Fspec) -> int:
    """
    We use this function to verify our Fspec type.

    This is how you can write a doctest:

    .. code:: python

        >>> fspec_function("/tmp/test.txt")
        58

    Enjoy!
    """
    path = Path(fspec)
    with open(path, "w") as fres:
        fres.write("When it stops hurting it will feel better. — Quien Sabe\n")
    rtn = path.stat().st_size
    unlink_path(path, missing_ok=True)
    return rtn
