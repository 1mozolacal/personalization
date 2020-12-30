import os
import time
import subprocess
import ctypes
import sys

# https://stackoverflow.com/questions/130763/request-uac-elevation-from-within-a-python-script/41930586#41930586
# def is_admin():
#     try:
#         return ctypes.windll.shell32.IsUserAnAdmin()
#     except:
#         return False

# if is_admin():
#     # Code of your program here
#     pass
# else:
#     # Re-run the program with admin rights
#     ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)
time.sleep(0.3)


def loadMinecarft():
    ctypes.windll.user32.ShowWindow(
        ctypes.windll.kernel32.GetConsoleWindow(), 6)
    os.system('"C:\\Program Files (x86)\\Minecraft Launcher\\MinecraftLauncher.exe"')
    exit()


while True:
    i = input()
    print(i)
    if (i == "minecraft"):
        loadMinecarft()
        exit()
    elif(i == "exit"):
        print("bye")
        time.sleep(0.2)
        exit()
    elif(i == "hide"):
        ctypes.windll.user32.ShowWindow(
            ctypes.windll.kernel32.GetConsoleWindow(), 6)

# print("booting up")
# time.sleep(1)
# print("thing")
# a = input()

# print(a)
# print("C:\us")
# subprocess.call(['"C:\\Program Files (x86)\\Minecraft Launcher\\MinecraftLauncher.exe"'])
# subprocess.call(  [  '"C:\\Users\\Calvin\\Desktop\\Fruitless Clicking\\Minecraft Launcher"'])


# print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
# time.sleep(1)
