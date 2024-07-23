//
//  RequestAuthorization.swift
//  DeviceActivityApp
//
//  Created by Pedro Somensi on 06/08/23.
//  Expanded by Riley Durbin on 07/23/24.
//

import Foundation
import FamilyControls

struct RequestAuthorization {
    
    private let center = AuthorizationCenter.shared
    
    func requestFamilyControls(for value: FamilyControlsMember) async -> Bool {
        
        do {
            try await center.requestAuthorization(for: value)
            return true
        } catch(let error) {
            debugPrint(error)
            return false
        }
        
    }
    
}
