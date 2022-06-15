//
//  ImagePicker.swift
//  MyAcademy
//
//  Created by khawlah khalid on 08/05/2022.
//

import UIKit
import SwiftUI

struct ImagePicker  : UIViewControllerRepresentable{

    @Binding var selectedImage:UIImage
    @Environment(\.presentationMode) private var presentationMode
    var  sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: Context) -> some UIViewController {

        let imagePiker = UIImagePickerController()
        imagePiker.allowsEditing = false
        imagePiker.sourceType =  sourceType
        imagePiker.delegate = context.coordinator
        
        return imagePiker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}



final class coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var parent : ImagePicker
   init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            parent.selectedImage = image
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
    
    
}

    func makeCoordinator() -> coordinator {
        coordinator(self)
    }
}



