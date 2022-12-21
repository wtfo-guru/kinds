from os import close
from tempfile import mkstemp

from kinds.fspec import fspec_function


def test_fspec_function():
    """Test type Fspec."""
    fd, nm = mkstemp()
    close(fd)
    assert fspec_function(nm) == 58
