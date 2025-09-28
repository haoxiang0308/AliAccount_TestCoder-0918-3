def reverse_string(s):
    """Reverses a given string."""
    return s[::-1]

def test_reverse_string():
    """Test cases for the reverse_string function."""
    assert reverse_string("hello") == "olleh"
    assert reverse_string("world") == "dlrow"
    assert reverse_string("") == ""
    assert reverse_string("a") == "a"
    assert reverse_string("12345") == "54321"

if __name__ == "__main__":
    test_reverse_string()
    print("All tests passed!")