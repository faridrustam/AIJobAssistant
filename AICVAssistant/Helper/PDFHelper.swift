//
//  PdfConvertHelper.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 17.02.26.
//

import Foundation
import PDFKit

final class PDFHelper {
    static func extractText(from url: URL) -> String {
        
        var text = ""
        
        let didStartAccessing = url.startAccessingSecurityScopedResource()
        
        defer {
            if didStartAccessing {
                url.stopAccessingSecurityScopedResource()
            }
        }
        
        guard let pdf = PDFDocument(url: url) else { return "" }
        
        for i in 0..<pdf.pageCount {
            if let page = pdf.page(at: i),
               let pageText = page.string {
                text += pageText + "\n"
            }
        }
        
        return text
    }
}
