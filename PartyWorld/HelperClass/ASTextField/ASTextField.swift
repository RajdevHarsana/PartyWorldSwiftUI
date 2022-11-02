//
//  ASTextField.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 03/06/22.
//

import SwiftUI
import UIKit


protocol ASTextFieldDelegate {
    func didBeginEditing(textField : UITextField)
    func didEndEditing(textField : UITextField)
    func didLeftItemtapped(_ button : UIButton)
}
extension ASTextFieldDelegate {
    func didBeginEditing(textField : UITextField) {}
    func didEndEditing(textField : UITextField) {}
    func didLeftItemtapped(_ button : UIButton) {}
}

struct ASTextField : UIViewRepresentable {
    
    var rightItem : UIImage?
    var leftItem : UIImage?
    var isSecuredEntry = false
    var handleLeftTap : (() -> ())  = {  }
    private let textField = UITextField()
    var delegate : ASTextFieldDelegate?
    @State var text : String?
    
    func makeUIView(context: UIViewRepresentableContext<ASTextField>) -> UITextField {
        
        textField.isSecureTextEntry = isSecuredEntry
        textField.text = text
        
        if let rightimg = rightItem {
            let button = UIButton()
            button.setImage(rightimg, for: .normal)
            button.addTarget(context.coordinator, action: #selector(context.coordinator.handleLeftTap(_:)), for: .touchUpInside)
            textField.rightView = button
            textField.rightViewMode = .always
        }
        
        if let leftImg = leftItem {
           let imgView = UIImageView()
           imgView.image = leftImg
           textField.leftView = imgView
           textField.leftViewMode = .always
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<ASTextField>) {
        DispatchQueue.main.async {
            self.text = uiView.text
        }
    }
    
    func makeCoordinator() -> ASTextField.Coordinator {
        Coordinator(self, isPassword : self.isSecuredEntry)
    }

    final class Coordinator : NSObject , UITextFieldDelegate {
        
        var parent : ASTextField
        private var isPasswordField : Bool
        init(_ parent : ASTextField , isPassword : Bool) {
            self.parent = parent
            self.isPasswordField = isPassword
        }
        
        @objc func handleLeftTap(_ button : UIButton) {
            if isPasswordField {
                self.parent.textField.isSecureTextEntry = !self.parent.textField.isSecureTextEntry
            } else {
                self.parent.handleLeftTap()
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.parent.delegate?.didEndEditing(textField: textField)
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.parent.delegate?.didBeginEditing(textField: textField)
        }
    }
}
