from enum import Enum
from collections import namedtuple

def str_to_int(hex_string):
    if hex_string.startswith('$'):
        return int(hex_string[1:], 16)
    elif hex_string.startswith('0x'):
        return int(hex_string[2:], 16)
    else:
        return int(hex_string)

Addressing_Modes = Enum('Addressing_Modes', 'Inherent Immediate Direct Indirect Extended')

Value = namedtuple("Value", "addr_mode value")
