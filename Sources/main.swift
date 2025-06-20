import Foundation

// Read the whole stdin as the exported note text
let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""

let chapters = WeChatParser.parse(text: input)
let encoder = JSONEncoder()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
if let jsonData = try? encoder.encode(chapters) {
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
}
