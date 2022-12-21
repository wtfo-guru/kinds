import pytest

from kinds.versioned import unlink_path

LBOGUS = "/file/does/not/exist/bogus.txt"


def test_unlink_path_missing_ok():
    """Assert unlink_path raises no exception."""
    try:
        unlink_path(LBOGUS, missing_ok=True)
    except FileNotFoundError as exc:
        pytest.fail("'unlink_path({0})' raised an exception {1}".format(LBOGUS, exc))


def test_unlink_path_missing_not_ok():
    """Assert unlink_path raises exception."""
    with pytest.raises(FileNotFoundError):
        unlink_path(LBOGUS, missing_ok=False)
