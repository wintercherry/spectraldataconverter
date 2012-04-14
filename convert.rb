require 'getoptlong'

if ARGV.length != 2
  puts "Usage: <command> <input-file> <output-file>"
  exit 1
end

inFileName = ARGV[0]
outFileName = ARGV[1]
outFileOptions = "w"

unless File.exists?(inFileName) and File.file?(inFileName)
  puts "Error: specified input file does not exist or is inaccessible."
  exit 2
end

inFile = File.new(inFileName)
outFile = File.new(outFileName, outFileOptions)

begin
  currentColumn = 1
  while (line = inFile.readline)
    numbers = Array.new
    line.chomp.scan(/\d+/) {|x|
      numbers << x.to_i
    }
    # the first number is a column, the next 5 are actual values with an implied column that we must insert
    if currentColumn != numbers[0]
      puts "Error: currentColumn is #{currentColumn}, but should be #{numbers[0]}"
      throw :unexpectedColumnNumber
    end
    currentColumn = numbers[0]
    outFile.write "#{currentColumn} #{numbers[1]}\n"
    numbers.slice!(0, 2)
    numbers.each {|n|
      currentColumn += 1
      outFile.write "#{currentColumn} #{n}\n"
    }
    currentColumn += 1
  end
rescue EOFError
  inFile.close
  outFile.close
end
