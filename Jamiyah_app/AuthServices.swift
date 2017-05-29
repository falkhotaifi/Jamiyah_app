//
//  AuthServices .swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/27/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import Foundation
import Firebase

class AuthServices{
    
    static func signUp(username: String, email: String, password: String, OnSeccuss: @escaping () -> Void, OnError: @escaping (_ ErrorMessage: String?) -> Void){
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if (error != nil) {
                OnError(error?.localizedDescription)
            }
            else {
                let uid = user?.uid
                self.setUserInfo(user_uid: uid!, email: email, username: username)
                OnSeccuss()
            }
        })
    }
    
    static func signIn(email: String, password: String, OnSeccuss: @escaping () -> Void, OnError: @escaping (_ ErrorMessage: String?) -> Void){
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if (error != nil) {
                OnError(error!.localizedDescription)
            }
            else {
                OnSeccuss()
            }
        })
    }
    
    static func reset_password(email: String, OnSeccuss: @escaping (_ confirmation: String) -> Void, OnError: @escaping (_ ErrorMessage: String?) -> Void){
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            if error != nil {
                OnError(error!.localizedDescription)
            } else {
                OnSeccuss("تم الارسل للإيميل \(email)")
                
            }
        })
    }
    
    static func setUserInfo (user_uid: String, email: String, username: String){
        let ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference().child("Users")
        let user_list = ref.child("User UID \(user_uid)")
        
        user_list.setValue(["E-mail address": email, "Username": username, "User uid": user_uid])
    }
}
