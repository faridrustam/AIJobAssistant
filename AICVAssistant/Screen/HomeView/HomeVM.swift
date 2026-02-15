//
//  HomeVM.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 11.02.26.
//

import Foundation

final class HomeVM: ObservableObject {
   
    let features: [Feature] = [
            Feature(
                title: "Build CV",
                subtitle: "Create a tailored resume instantly",
                icon: "doc.text",
                featureType: .cv
            ),
            Feature(
                title: "Cover Letter",
                subtitle: "Write persuasive letters",
                icon: "envelope",
                featureType: .coverLetter
            ),
            Feature(
                title: "ATS Checker",
                subtitle: "Test your resume against AI filters",
                icon: "checkmark.seal",
                featureType: .ats
            )
        ]
}
