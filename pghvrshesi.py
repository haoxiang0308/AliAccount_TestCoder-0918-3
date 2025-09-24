import pytest

def reverse_string(s):
    """Reverses a string."""
    return s[::-1]

def test_reverse_string():
    """Test case for the reverse_string function."""
    assert reverse_string("hello") == "olleh"
    assert reverse_string("") == ""
    assert reverse_string("a") == "a"
    assert reverse_string("12345") == "54321"

if __name__ == "__main__":
    pytest.main()