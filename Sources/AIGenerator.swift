import Foundation

/// Simple protocol describing an AI note generator
protocol AINoteGenerator {
    func generateNotes(from chapters: [Chapter]) async throws -> String
}

/// Placeholder implementation that would call the OpenAI API in a real app
struct OpenAIService: AINoteGenerator {
    var apiKey: String

    func generateNotes(from chapters: [Chapter]) async throws -> String {
        // TODO: Integrate OpenAI API. For now we just return a joined summary.
        let summary = chapters.flatMap { $0.highlights.map { $0.text } }.joined(separator: "\n")
        return "Summary:\n" + summary
    }
}
