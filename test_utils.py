"""
Unit tests for utility functions
"""

from utils import add_numbers, get_project_info


def test_add_numbers():
    """
    Test the add_numbers function
    """
    assert add_numbers(2, 3) == 5
    assert add_numbers(-1, 1) == 0
    assert add_numbers(0, 0) == 0


def test_get_project_info():
    """
    Test the get_project_info function
    """
    info = get_project_info()
    assert info['course'] == 'Cloud MLOps'
    assert info['assignment'] == 3
    assert 'title' in info
