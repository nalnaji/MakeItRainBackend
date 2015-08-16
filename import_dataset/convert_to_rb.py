#!/bin/python
# convert_to_rb.py
# First, the script orders the GUIDs and converts them to integers starting at 0
# Then, it outputs a ruby file for easy import into the database

inputFilename = "anon_cons_hourly.csv"
outputFilename = "import_readings.rb"

allDataTokens = []

with open(inputFilename, 'r') as inputFile:
    while True:
        line = inputFile.readline()
        if line == "":
            break
        # Remove trailing newline
        line = line[:-1]
        tokens = line.split(",")
        if len(tokens) == 1:
            # Skip empty line
            continue
        allDataTokens += [tokens,]

guidIndex = 0
guidMap = {}
for dataPoint in allDataTokens:
    guid = dataPoint[1]
    if guid not in guidMap:
        guidMap[guid] = guidIndex
        guidIndex += 1

resultCode = "reading_list = ["
for dataPoint in allDataTokens:
    resultCode += "\n    [ "
    # Date
    resultCode += "\"" + dataPoint[0] + "\", "
    # ID
    resultCode += str(guidMap[dataPoint[1]]) + ", "
    # Hourly Amount
    resultCode += dataPoint[2] + " "
    resultCode += "],"

# Remove trailing comma
resultCode = resultCode[:-1]
resultCode += "\n]\n\n"
resultCode += "reading_list.each do |date, user_id, reading_cf|\n"
resultCode += "    Reading.create( date: date, user_id: user_id, " \
        + "reading_cf: reading_cf )\n"
resultCode += "end\n"


with open(outputFilename, 'w') as outputFile:
    outputFile.write(resultCode)