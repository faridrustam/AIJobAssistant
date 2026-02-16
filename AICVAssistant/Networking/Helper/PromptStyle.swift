//
//  PromptStyle.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation


enum PromptStyle {
    
    case atsScore(cv: String, job: String)
    case improveCV(cv: String)
    case coverLetter(cv: String, job: String)
    
    var text: String {
        switch self {
        case .atsScore(let cv, let job):
            return """
            You are an ATS system.

            Analyze this CV and give:
            - ATS score (0-100)
            - Missing keywords
            - Suggestions

            CV:
            \(cv)

            Job Description:
            \(job)
            """
            
        case .improveCV(let cv):
            return """
            Improve this CV professionally and make it ATS-friendly:
            \(cv)
            """
            
        case .coverLetter(let cv, let job):
            return """
            Write a professional cover letter based on this CV and job description.
            CV:
            \(cv)

            Job:
            \(job)
            """
        }
    }
}
