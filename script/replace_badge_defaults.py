import shutil
import os

GH_HANDLE = f'{os.environ["GH_HANDLE"]}'

# Default badge data that needs to be replaced
SEARCH_TEXT = """Universe 2022
Mona
Octocat
@github"""

# Holds the badge data that gets generated
REPLACE_TEXT = ""

# final badge.py file
FINAL_SCRIPT = ""

# Open generated badge.txt file and get the necessary data
with open(f'script/build/{GH_HANDLE}/badge.txt', "r") as f:
    REPLACE_TEXT = f.read()

# Read the badge.py file where the default data needs to be replaced
with open("micropython/examples/badger2040/badge.py", "r") as f:
    FINAL_SCRIPT = f.read()

# Replace default badge data
FINAL_SCRIPT = FINAL_SCRIPT.replace(SEARCH_TEXT, REPLACE_TEXT)

# Write python script back to badge.py
with open("micropython/examples/badger2040/badge.py", "w") as f:
    f.write(FINAL_SCRIPT)
    f.flush()

# Replace contributions data
shutil.copy(f'script/build/{GH_HANDLE}/contribution_page_1.txt', 'micropython/examples/badger2040/assets/contribution_page_1.txt')
shutil.copy(f'script/build/{GH_HANDLE}/contribution_page_2.txt', 'micropython/examples/badger2040/assets/contribution_page_2.txt')

# Replace default gh_qrcode.png file
shutil.copy(f'script/build/{GH_HANDLE}/gh_qrcode.png', 'micropython/examples/badger2040/assets/gh_qrcode.png')
