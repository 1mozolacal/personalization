#Master
#Exe
#Of
#Windows
#By:Calvin Mozola
#Dec 11, 2020

import os
import time
import ctypes #used to hide the window
from abc import ABC, abstractmethod

class MEOWException(Exception):
    pass

class InvalidCommandFormation(MEOWException):
    def __init__(self, expression, message="Generic Command format issue"):
        self.expression = expression
        self.message = message
        #super().__init__(self.message)
    
    def __str__(self):
        return '"{}" is not formatted correctly ({})'.format(self.expression,self.message)

class BaseMeowCommand(ABC):

    def __init__(self,name):
        self.name = name
        self.passedData = []
        self.passedModifiers = []
        self.baseDelimeter = " "
        self.extendedDelimeter = '"'
        self.modifiersDefiner = "-"

    @abstractmethod
    def executeCommand(self):
        pass

    def run(self, command):
        commandName, modifiers, data = self.parseCommand(command)
        self.passedModifiers = modifiers
        self.passedData = data

        return self.executeCommand()

    def parseCommand(self,command):
        mods = []
        data = []
        name = ''

        if(command.count(self.extendedDelimeter)%2 != 0):
            raise InvalidCommandFormation(command,f"Odd number of {self.extendedDelimeter}")

        extendedSplit = [x for x in command.split(self.extendedDelimeter) if x != '']
        allParts = []
        for index,part in enumerate(extendedSplit):
            if(index%2==0):
                allParts.extend([x for x in part.split(self.baseDelimeter) if x != ''])
            else:
                allParts.append(part)
        
        if len(allParts) < 1:
            raise InvalidCommandFormation(command," Has no arguments passed.")
        if(not self.name == allParts[0] ):
            raise InvalidCommandFormation(
                "IN:{}, given:{}, expected:{}".format(command,allParts[0],self.name),
                "Command name mis-match(seems like something has been appended to the front or the front has been trimmed)")

        for index,part in enumerate(allParts):
            if part[0] == self.modifiersDefiner:
                mods.append(part)
            elif index >0:
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
        ctypes.windll.user32.ShowWindow( ctypes.windll.kernel32.GetConsoleWindow(), 6 )
        os.system('"C:\\Program Files (x86)\\Minecraft Launcher\\MinecraftLauncher.exe"')
        if not "-noexit" in self.passedModifiers:
            exit()
        if not "-staydown" in self.passedModifiers:
            ctypes.windll.user32.ShowWindow( ctypes.windll.kernel32.GetConsoleWindow(), 9 ) 

    def executeCommand(self):
        if self.passedData:
            if self.passedData[0] == 'minecraft':
                self.loadMinecarft()

class ExitCommand(BaseMeowCommand):
    def executeCommand(self):
        exit()

class TestCommand(BaseMeowCommand):
    def executeCommand(self):
        ctypes.windll.user32.ShowWindow( ctypes.windll.kernel32.GetConsoleWindow(), 6 )
        time.sleep(1)
        if "-exit" in self.passedModifiers:
            exit()
        if not "-staydown" in self.passedModifiers:
            ctypes.windll.user32.ShowWindow( ctypes.windll.kernel32.GetConsoleWindow(), 9 ) 

def main():
    commandRegistry = {
        "echo": EchoCommand,
        "exit": ExitCommand,
        "fun": FunCommand,
        "test": TestCommand,
    }
    while True:
        userInput = input()
        commandName = userInput.split(" ")[0]
        if( commandName in commandRegistry):
            newCommand = commandRegistry[commandName](commandName)
            newCommand.run(userInput)
        else:
            print("not registered commanddd")

if __name__ == "__main__":
    main()