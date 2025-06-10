#!/bin/python3
import os
import xml.etree.ElementTree as ET
from xml.dom import minidom


class SMSCategorizer:
    """
      For categorizing XML SMS data into their specific transaction types

      Args:
          input_file(str): path to the raw xml file
          output_dir(str): directory path to save the files ccording to their category
      """

    def __init__(self, input_file, output_dir):
        """ Initialize with input file and output directory"""

        self.input_file = input_file
        self.output_dir = output_dir
        self.root = None
        self.categories = {}  # Dict to mapp category names to condition func

        # Create output directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)