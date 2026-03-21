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
    case coverLetter(cv: String, job: String, company: String, tone: String)
    
    var text: String {
        switch self {
        case .atsScore(let cv, let job):
            return """
            You are an ATS system.

            Analyze this CV and give:
            - ATS score (0-100)
            - Critical warnings (give minimum 3 reason)
            - Missing keywords
            - Suggestions (Type short and concrete)

            CV:
            \(cv)

            Job Target:
            \(job)
            
            Return the result strictly in JSON format like this:

            {
              "score": 100,
              "warnings": [
                { "title": "...", "description": "..." }
              ],
              "missingKeywords": ["..."],
              "suggestions": [
                { "title": "...", "description": "..." }
              ]
            }
            """
            
        case .improveCV(let cv):
            return """
            Improve this CV professionally and make it ATS-friendly:
            \(cv)
            """
            
        case .coverLetter(let cv, let job, let company, let tone):
            return """
            Write a tailored and compelling cover letter based on this CV, the job description, and the company information. Do not type date.
            CV:
            \(cv)

            Job:
            \(job)
            
            Company:
            \(company)
            
            Write the cover letter like this tone:
            \(tone)
            """
        }
    }
}
