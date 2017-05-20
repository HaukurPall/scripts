import unittest
import argparse

def main():
    parser = argparse.ArgumentParser(description='What_does_the_program_do?')
    parser.add_argument('--foo', help='foo of the %(prog)s program')
    args = parser.parse_args()

if __name__ == "__main__":
    unittest.main()
    main()