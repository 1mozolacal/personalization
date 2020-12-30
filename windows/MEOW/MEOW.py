# Master
# Exe
# Of
# Windows
# By:Calvin Mozola
# Dec 11, 2020

import os
import time
import ctypes  # used to hide the window
from abc import ABC, abstractmethod

# CONSTANTS
VS_CODE_PATH = '"C:\\Users\\Calvin\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe"'
REPO_DICT = {
    "port": "portfolio",
    "meow": "personalization\\windows\\MEOW",
    "star": "StarCraftAI",
}

# Library constants
CTYPE_MINIZE_WINDOW = 6
CTYPE_SHOW_WINDOW = 9
# END CONSTANTS


class MEOWException(Exception):
    pass


class InvalidCommandFormation(MEOWException):
    def __init__(self, expression, message="Generic Command format issue"):
        self.expression = expression
        self.message = message
        # super().__init__(self.message)
        self.preCommandResults = None
        self.commandResults = None
        self.postCommandResults = None

    def __str__(self):
        return '"{}" is not formatted correctly ({})'.format(self.expression, self.message)


class BaseMeowCommand(ABC):

    def __init__(self, name):
        self.name = name
        self.passedData = []
        self.passedModifiers = []
        self.baseDelimeter = " "
        self.extendedDelimeter = '"'
        self.modifiersDefiner = "-"

    @abstractmethod
    def executeCommand(self):
        pass

    def preCommand(self):
        pass

    def postCommand(self):
        pass

    def commandResults(self):
        theRes = (self.preCommandResults, self.commandResults,
                  self.postCommandResults)
        return theRes

    def getResults(self):
        theRes = (self.preCommandResults, self.commandResults,
                  self.postCommandResults)
        return theRes

    def run(self, command):
        commandName, modifiers, data = self.parseCommand(command)
        self.passedModifiers = modifiers
        self.passedData = data

        self.preCommandResults = self.preCommand()
        self.commandResults = self.executeCommand()
        self.postCommandResults = self.postCommand()
        # results = self.commandResults()  # I don't know why this acts up
        results = self.getResults()
        return results

    def parseCommand(self, command):
        mods = []
        data = []
        name = ''

        if(command.count(self.extendedDelimeter) % 2 != 0):
            raise InvalidCommandFormation(
                command, f"Odd number of {self.extendedDelimeter}")

        extendedSplit = [x for x in command.split(
            self.extendedDelimeter) if x != '']
        allParts = []
        for index, part in enumerate(extendedSplit):
            if(index % 2 == 0):
                allParts.extend(
                    [x for x in part.split(self.baseDelimeter) if x != ''])
            else:
                allParts.append(part)

        if len(allParts) < 1:
            raise InvalidCommandFormation(command, " Has no arguments passed.")
        if(not self.name == allParts[0]):
            raise InvalidCommandFormation(
                "IN:{}, given:{}, expected:{}".format(
                    command, allParts[0], self.name),
                "Command name mis-match(seems like something has been appended to the front or the front has been trimmed)")

        for index, part in enumerate(allParts):
            if part[0] == self.modifiersDefiner:
                mods.append(part)
            elif index > 0:
                data.append(part)

        return (allParts[0], mods, data)


class EchoCommand(BaseMeowCommand):

    def executeCommand(self):
        print(f"Name of command: {self.name}.")
        print("\tModifiers...")
        for mod in self.passedModifiers:
            print(mod)
        print("\tData ...")
        for datum in self.passedData:
            print(datum)
        print("\tdone.")


class FunCommand(BaseMeowCommand):
    def loadMinecarft(self):
        ctypes.windll.user32.ShowWindow(
            ctypes.windll.kernel32.GetConsoleWindow(), 6)
        os.system(
            '"C:\\Program Files (x86)\\Minecraft Launcher\\MinecraftLauncher.exe"')
        if not "-noexit" in self.passedModifiers:
            exit()
        if not "-staydown" in self.passedModifiers:
            ctypes.windll.user32.ShowWindow(
                ctypes.windll.kernel32.GetConsoleWindow(), 9)

    def executeCommand(self):
        if self.passedData:
            if self.passedData[0] == 'minecraft':
                self.loadMinecarft()


class HideableCommand(BaseMeowCommand):
    def hideMe(self):
        if not "-stayup" in self.passedModifiers:
            ctypes.windll.user32.ShowWindow(
                ctypes.windll.kernel32.GetConsoleWindow(), CTYPE_MINIZE_WINDOW)

    def showMe(self):
        if not "-staydown" in self.passedModifiers:
            ctypes.windll.user32.ShowWindow(
                ctypes.windll.kernel32.GetConsoleWindow(), CTYPE_SHOW_WINDOW)

    def preCommand(self):
        self.hideMe()

    def postCommand(self):
        self.showMe()


class ExitAfterCommand(BaseMeowCommand):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.commandShouldExitOnPost = False

    def checkToExitMe(self):
        if "-noexit" in self.passedModifiers:
            return
        if self.commandShouldExitOnPost or "-exit" in self.passedModifiers:
            exit()

    def postCommand(self):
        self.checkToExitMe()


class ExitCommand(BaseMeowCommand):
    def executeCommand(self):
        exit()


class OpenRepoCommand(ExitAfterCommand, HideableCommand):
    def executeCommand(self):
        if not self.passedData:
            print("you need to pass data")
            return
        if self.passedData[0] in REPO_DICT:
            command = VS_CODE_PATH + " C:\\Users\\Calvin\\Documents\\GitKraken\\" + \
                REPO_DICT[self.passedData[0]]
            returnVal = os.system(command)
            self.commandShouldExitOnPost = True
        else:
            print(
                f"Not found in fast serch dict {REPO_DICT.keys()}.\nLooking for exact match...")
            pathToFile = "C:\\Users\\Calvin\\Documents\\GitKraken\\" + \
                self.passedData[0]
            if(os.path.exists(pathToFile)):
                command = VS_CODE_PATH + pathToFile
                os.system(command)
                self.commandShouldExitOnPost = True
            else:
                print("file not found")

    def postCommand(self):
        self.checkToExitMe()
        self.showMe()


class TestCommand(BaseMeowCommand):
    def executeCommand(self):
        # ctypes.windll.user32.ShowWindow( ctypes.windll.kernel32.GetConsoleWindow(), 6 )
        # time.sleep(1)
        command = VS_CODE_PATH + ' C:\\Users\\Calvin\\Documents'
        print(command)
        os.system(command)
        # os.system(VS_CODE_PATH + ' "C:\\Users\\Calvin\\Documents\\Digital Filing cabnet\\Ryerson Stuff\\Formula\\Logs and backups\\DAQ\\2020 12 29 - logs"')
        # print(VS_CODE_PATH + ' "C:\\Users\\Calvin\\Documents\\Digital Filing cabnet\\Ryerson Stuff\\Formula\\Logs and backups\\DAQ\\2020 12 29 - logs"')
        # os.system(VS_CODE_PATH)
        if "-exit" in self.passedModifiers:
            exit()
        # if not "-staydown" in self.passedModifiers:
            # ctypes.windll.user32.ShowWindow( ctypes.windll.kernel32.GetConsoleWindow(), 9 )


def main():
    commandRegistry = {
        "echo": EchoCommand,
        "exit": ExitCommand,
        "fun": FunCommand,
        "test": TestCommand,
        "gits": OpenRepoCommand,
    }
    while True:
        userInput = input()
        commandName = userInput.split(" ")[0]
        if(commandName in commandRegistry):
            newCommand = commandRegistry[commandName](commandName)
            newCommand.run(userInput)
        else:
            print("not registered command")


if __name__ == "__main__":
    main()
