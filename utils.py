"""
Utility functions for the Flask application
"""


def add_numbers(a, b):
    """
    Simple function to add two numbers
    Used for pytest demonstration
    """
    return a + b


def get_project_info():
    """
    Returns project information
    """
    return {
        'course': 'Cloud MLOps',
        'assignment': 3,
        'title': 'End-to-End CI/CD Pipeline for Flask App'
    }
