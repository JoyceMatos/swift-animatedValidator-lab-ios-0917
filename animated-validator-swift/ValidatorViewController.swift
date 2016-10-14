//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    var submitCounter = Int()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    //TODO: Add self.view.layoutifneeded on all animations
    // .becomefirstresponder (brings up keyboard) //
    // .resignfirstresponder (brings keyboard down) //
    // .transform to scale images, make them grow, etc
    
    @IBAction func emailEditingEnded(_ sender: AnyObject) {
        if (emailTextField.text?.contains("@"))! && (emailTextField.text?.contains("."))! {
            print("valid")
            self.emailTextField.backgroundColor = UIColor.white
            submitCounter += 1
            submitButtonStatus()
        } else {
            print("invalid")
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseInOut, .autoreverse],animations: {
                self.emailTextField.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                }, completion: nil)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse], animations: {
                self.emailTextField.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
                }, completion: nil)
    }
        
    }
    @IBAction func confirmEmailEditingEnded(_ sender: AnyObject) {
        if (emailConfirmationTextField.text?.contains("@"))! && (emailConfirmationTextField.text?.contains("."))! {
            print("valid")
            self.emailConfirmationTextField.backgroundColor = UIColor.white
            submitCounter += 1
            submitButtonStatus()
        } else {
            print("invalid")
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseInOut, .autoreverse],animations: {
                self.emailConfirmationTextField.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                }, completion: nil)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse], animations: {
                self.emailConfirmationTextField.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
                }, completion: nil)
        }
    }
    @IBAction func phoneEditingEnded(_ sender: AnyObject) {
        let possibleNumbers = phoneTextField.text
        if Int(possibleNumbers!) != nil && (phoneTextField.text?.characters.count)! >= 7  {
                print("valid")
            self.phoneTextField.backgroundColor = UIColor.white
            submitCounter += 1
            submitButtonStatus()
            } else {
                print("invalid")
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseInOut, .autoreverse],animations: {
                self.phoneTextField.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                }, completion: nil)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse], animations: {
                self.phoneTextField.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
                }, completion: nil)
            }
        }
    
    @IBAction func passwordEditingEnded(_ sender: AnyObject) {
        if (passwordTextField.text?.characters.count)! >= 6 {
            print("valid")
            self.passwordTextField.backgroundColor = UIColor.white
            submitCounter += 1
            submitButtonStatus()
        } else {
            print("invalid")
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseInOut, .autoreverse],animations: {
                self.passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.7)
                }, completion: nil)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse], animations: {
                self.passwordTextField.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
                }, completion: nil)
        }
    }
    
    @IBAction func confirmPasswordEditingEnded(_ sender: AnyObject) {
        if passwordConfirmTextField.text! == passwordTextField.text {
            print("valid")
            submitCounter += 1
            submitButtonStatus()
            } else {
                print("invalid")
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseIn, .autoreverse],animations: {
                self.passwordConfirmTextField.backgroundColor = UIColor.red
                }, completion: nil)
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse], animations: {
                self.passwordConfirmTextField.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
                }, completion: nil)
            }
        }
    
    func submitButtonStatus() {
        if submitCounter == 5 {
            submitButton.isEnabled = true
            
//            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
//                self.submitButton.frame.origin.y -= 250
//                }, completion: nil)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.submitButton.frame.origin.y -= 250
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
    }

}
