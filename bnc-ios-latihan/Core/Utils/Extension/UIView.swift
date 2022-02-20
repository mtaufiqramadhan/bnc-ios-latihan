//
//  UIView.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

var vSpinner : UIView?

extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "Gesture"
    }
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    @objc func tapGesture(action: (() -> Void)?) {
        isUserInteractionEnabled = true
        tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        let indicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)

        indicator.center = spinnerView.center
        indicator.startAnimating()
            
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }
            
        vSpinner = spinnerView
    }
        
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    func setupToolbar(textfield: UITextField){
        let bar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Tutup Keyboard", style: .plain, target: self, action: #selector(dismissMyKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        
        textfield.inputAccessoryView = bar
    }
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        self.gestureRecognizers?.removeAll()
        self.endEditing(true)
    }
}
