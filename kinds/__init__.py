"""Top-level package for kinds."""

import sys
from os import PathLike
from typing import Any, Dict, Union

if sys.version_info >= (3, 9):
    Fspec = Union[str, PathLike[str]]
else:
    Fspec = Union[str, "PathLike[str]"]

StrAnyDict = Dict[str, Any]  # type: ignore
