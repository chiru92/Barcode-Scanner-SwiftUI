//
//  Alert.swift
//  Barcode Scanner
//
//  Created by CHIRANJIT SARKAR on 26/08/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContex {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input.",
                                              dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Device Input",
                                              message: "This value scanned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismissButton: .default(Text("OK")))
}
