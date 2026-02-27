//
//  SignUpViewModel.swift
//  GourmetBrew
//
//  Created by admin on 27/02/26.
//

import Foundation
class SignUpViewModel {
    
    var onValidationError: ((String) -> Void)?
    var onButtonState: ((Bool) -> Void)?
    
    func passwordIcorrect(password: String?, confirmPassword: String?) {
        guard let password = password,
              let confirmPassword = confirmPassword,
              !password.isEmpty,
              !confirmPassword.isEmpty else {
            onButtonState?(false)
            return
        }
        if password != confirmPassword {
            onValidationError?("As senhas não conferem")
        } else {
            onButtonState?(true)
        }
    }
    

}
