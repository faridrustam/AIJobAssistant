//
//  Feature.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 11.02.26.
//

import Foundation

enum FeatureType: Hashable {
    case cv
    case coverLetter
    case ats
}

struct Feature: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let featureType: FeatureType
}
