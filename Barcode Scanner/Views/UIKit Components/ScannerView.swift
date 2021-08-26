//
//  ScannerView.swift
//  Barcode Scanner
//
//  Created by CHIRANJIT SARKAR on 26/08/21.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ScannerVC
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContex.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContex.invalidScannedType
            }
        }
    }
}

//struct ScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView(scannedCode: .constant("369852147"), alertItem: .constant(<#T##value: AlertItem?##AlertItem?#>))
//    }
//}
