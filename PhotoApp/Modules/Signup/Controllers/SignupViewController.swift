    //
    //  SignupViewController.swift
    //  PhotoApp
    //
    //  Created by Fady Ramzy on 9/8/20.
    //  Copyright © 2020 Fady Ramzy. All rights reserved.
    //mmmmmm
    
    import UIKit
    
    class SignupViewController: UIViewController {
        
        // MARK: - IBOutlets
        
        @IBOutlet weak var firstNameTextField: UITextField!
        @IBOutlet weak var lastNameTextField: UITextField!
        @IBOutlet weak var emailAddressTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        @IBOutlet weak var repeatPasswordTextField: UITextField!
        @IBOutlet weak var signupButton: UIButton!
        @IBOutlet weak var phoneNumberTextField: UITextField!
        
        // MARK: - Properties
        
        var presenter: SignupPresenterProtocol?
        
        // MARK: - View life cycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if presenter == nil {
                let signupModelValidator = SignUpFormValidatorModel()
                let signupWebService = SignUpWebService(urlString: RequestPaths.signup)
                presenter = SignupPresenter(formValidator: signupModelValidator, webService: signupWebService, signupViewProtocol: self)
            }
        }
        
        // MARK: - IBAction
        
        @IBAction func didTapSignupButton(_ sender: Any) {
            let signupFormModel = SignupFormModel(firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailAddressTextField.text, password: passwordTextField.text, repeatPassword: repeatPasswordTextField.text)
            presenter?.didTapSignUpButton(with: signupFormModel)
        }
    }
    
    // MARK: - extensions
    
    
    extension SignupViewController: SignupViewProtocol {
        func successfullSignup() {
            let alert = UIAlertController(title: "Congratulations", message: "The signup operation has been completed Successfully", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            
            DispatchQueue.main.async {
                alert.view.accessibilityIdentifier = "successAlertDialog"
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        func errorHandler(error: Error) {
            let alert = UIAlertController(title: "Error Dialog", message: error.localizedDescription, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            
            DispatchQueue.main.async {
                alert.view.accessibilityIdentifier = "errorAlertDialog"
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
