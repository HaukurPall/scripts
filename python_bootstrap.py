import unittest
import argparse

def main():
    parser = argparse.ArgumentParser(description='What_does_the_program_do?')
    group = parser.add_mutually_exclusive_group()
    group.add_argument('-v', '--verbose', action='store_true')
    group.add_argument('-q', '--quiet', action='store_true')
    parser.add_argument('-f', '--foo', help='foo of the %(prog)s program')
    args = parser.parse_args()

if __name__ == "__main__":
    unittest.main()
    main()