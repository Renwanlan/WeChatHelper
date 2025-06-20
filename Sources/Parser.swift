import Foundation

struct Highlight: Codable {
    var text: String
    var comment: String?
}

struct Chapter: Codable {
    var title: String
    var highlights: [Highlight]
}

/// Parses exported WeChat notes into an array of chapters
struct WeChatParser {
    static func parse(text: String) -> [Chapter] {
        var chapters: [Chapter] = []
        var currentChapter = Chapter(title: "Untitled", highlights: [])

        let lines = text.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
        var index = 0
        while index < lines.count {
            let line = lines[index].trimmingCharacters(in: .whitespaces)
            if line.hasPrefix("#") { // chapter heading
                if !currentChapter.highlights.isEmpty || currentChapter.title != "Untitled" {
                    chapters.append(currentChapter)
                }
                currentChapter = Chapter(title: String(line.dropFirst()).trimmingCharacters(in: .whitespaces), highlights: [])
            } else if line.hasPrefix("-") { // highlight line
                var comment: String? = nil
                if index + 1 < lines.count {
                    let next = lines[index + 1].trimmingCharacters(in: .whitespaces)
                    if next.hasPrefix(">") {
                        comment = String(next.dropFirst()).trimmingCharacters(in: .whitespaces)
                        index += 1
                    }
                }
                let highlightText = String(line.dropFirst()).trimmingCharacters(in: .whitespaces)
                currentChapter.highlights.append(Highlight(text: highlightText, comment: comment))
            }
            index += 1
        }
        if !currentChapter.highlights.isEmpty || currentChapter.title != "Untitled" {
            chapters.append(currentChapter)
        }
        return chapters
    }
}
