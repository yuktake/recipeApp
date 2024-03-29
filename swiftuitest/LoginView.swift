//
//  LoginView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/27.
//

import SwiftUI
import Combine
import Amplify
import AWSCognitoAuthPlugin

struct LoginView: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertTitle = "Error"
    @State var alertMessage = "Something went wrong."
    @State var isLoading = false
    @State var isSuccessful = false
    @State var showConfirm = false
    @State var passwordConfirm = false
    @State var verification_code = ""
    @State var password_reset_code = ""
    @State var newPassword = ""
    @State var loginButton = true
    @State var forgotButton = false
    @State var resendButton = false
    @State var formHeight:CGFloat = 136
    @State var buttonText = "Login"
    
    @EnvironmentObject var user:UserStore
    
    
    func signup(){
        print("signup")
        self.hideKeyboard()
        self.isFocused = false
        self.isLoading = true
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
//        Amplify.Auth.signUp(username: username, password: password, options: options){ result in
        Amplify.Auth.signUp(username: email, password: password, options: options){ result in
            switch result {
            case .success(let signUpResult):
                self.isLoading = false
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    self.showConfirm = true
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
                self.alertTitle = "Error"
                self.alertMessage = error.errorDescription
                self.showAlert = true
                self.isLoading = false
            }
        }
    }
    
    func confirmSignUp() {
//        Amplify.Auth.confirmSignUp(for: username, confirmationCode: self.verification_code) { result in
        Amplify.Auth.confirmSignUp(for: email, confirmationCode: self.verification_code) { result in
            switch result {
            case .success:
                login(signup: true)
            case .failure(let error):
                self.alertTitle = "Error"
                self.showAlert = true
                self.isLoading = false
                self.alertMessage = error.errorDescription
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
    
    func resendVerification() {
        print("resend verification")
        Amplify.Auth.resendSignUpCode(for: email, listener: { result in
            switch result {
            case .success(let result):
                print("Resend code success \(result)")
                self.alertTitle = "Success"
                self.alertMessage = "Send Verification Mail!!"
                self.showAlert = true
                self.showConfirm = true
            case  .failure(let error):
                self.alertTitle = "Error"
                self.showAlert = true
                self.isLoading = false
                self.alertMessage = error.errorDescription
                print("Resend Code failed with error \(error)")
            }
        })
    }
    
    func resetPassword(email: String) {
        Amplify.Auth.resetPassword(for: email) { result in
            do {
                let resetResult = try result.get()
                switch resetResult.nextStep {
                case .confirmResetPasswordWithCode(let deliveryDetails, let info):
                    print("Confirm reset password with code send to - \(deliveryDetails) \(info)")
                    self.passwordConfirm = true
                case .done:
                    print("Reset completed")
                }
            } catch {
                self.alertTitle = "Error"
                self.showAlert = true
                self.isLoading = false
                self.alertMessage = "Got Error"
                print("Reset password failed with error \(error)")
            }
        }
    }
    
    func confirmResetPassword(
        email: String,
        newPassword: String,
        confirmationCode: String
    ) {
        Amplify.Auth.confirmResetPassword(
            for: email,
            with: newPassword,
            confirmationCode: confirmationCode
        ) { result in
            switch result {
            case .success:
                print("Password reset confirmed")
                self.forgotButton.toggle()
                buttonText = "Login"
                formHeight = 136
                self.passwordConfirm = false
            case .failure(let error):
                self.alertTitle = "Error"
                self.showAlert = true
                self.isLoading = false
                self.alertMessage = error.errorDescription
                print("Reset password failed with error \(error)")
            }
        }
    }
    
    func login(signup:Bool=false) {
        print("login")
        if (!signup) {
            self.hideKeyboard()
            self.isFocused = false
            self.isLoading = true
        }

        Amplify.Auth.signIn(username: email, password: password) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    print("Sign in succeeded")
                    self.isLoading = false
                    self.isSuccessful = true
                    self.user.isLogged = true
                    UserDefaults.standard.set(UUID().uuidString, forKey: "username")
                    UserDefaults.standard.set(true, forKey: "isLogged")
                    user.getAuthInfo(email: self.email)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        self.isSuccessful = false
                        self.username = ""
                        self.email = ""
                        self.password = ""
                        self.user.showLogin = false
                        self.showConfirm = false
                    }
                }
            case .failure(let error):
                print("Sign in failed \(error)")
                self.isLoading = false
                self.alertMessage = error.errorDescription
                self.showAlert = true
                self.alertTitle = "Error"
            }
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top) {
                    VStack {
                        CoverView()
                        
                        VStack {
                            HStack {
                                Image(systemName: "envelope.circle.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                    .frame(width:44, height: 44)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                                    .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                                    .padding(.leading)
                                TextField("Your Email".uppercased(), text:$email)
                                    .keyboardType(.emailAddress)
                                    .font(.subheadline)
                                    .padding(.leading)
                                    .frame(height:44)
                                    .onTapGesture {
                                        self.isFocused = true
                                    }
                            }
                            
                            Divider().padding(.leading, 80)
                            
                            if !forgotButton || resendButton {
                                HStack {
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                        .frame(width:44, height: 44)
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                                        .padding(.leading)
                                    SecureField("Password".uppercased(), text:$password)
                                        .keyboardType(.default)
                                        .font(.subheadline)
                                        .padding(.leading)
                                        .frame(height:44)
                                        .onTapGesture {
                                            self.isFocused = true
                                        }
                                }
                            }
                        }
                        .frame(height: formHeight)
                        .frame(maxWidth: .infinity)
                        .background(BlurView(style: .systemMaterial))
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
                        .padding()
                        
                        if !forgotButton {
                            HStack {
                                Button(action: {
                                    loginButton.toggle()
                                    forgotButton = false
                                    if (loginButton) {
                                        if (forgotButton) {
                                            buttonText = "Reset Password"
                                            formHeight = 68
                                        } else {
                                            buttonText = "Login"
                                            formHeight = 136
                                        }
                                    } else {
                                        buttonText = "Signup"
                                        formHeight = 136
                                    }
                                }){
                                    Text(loginButton ? "Create Account?" : "LogIn")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    
                    
                        HStack {
                            if loginButton {
                                Button(action: {
                                    self.forgotButton.toggle()
                                    if (loginButton) {
                                        if (forgotButton) {
                                            buttonText = "Reset Password"
                                            formHeight = 68
                                        } else {
                                            buttonText = "Login"
                                            formHeight = 136
                                        }
                                    } else {
                                        buttonText = "Signup"
                                        formHeight = 136
                                    }
                                }){
                                    Text(self.forgotButton ? "Login" : "Forget password?")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            } else {
                                Button(action: {
                                    self.forgotButton.toggle()
                                    if (forgotButton) {
                                        buttonText = "Send"
                                        formHeight = 136
                                        resendButton = true
                                    } else {
                                        buttonText = "Signup"
                                        formHeight = 136
                                        resendButton = false
                                    }
                                }){
                                    Text(self.forgotButton ? "Signup" : "Resend Verification?")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Spacer()
                            Button(action: {
                                if (loginButton) {
                                    if (forgotButton) {
                                        resetPassword(email: email)
                                    } else {
                                        self.login()
                                    }
                                } else {
                                    if (forgotButton) {
                                        self.resendVerification()
                                    } else {
                                        self.signup()
                                    }
                                }
                            }){
                                Text(buttonText)
                                    .foregroundColor(.black)
                            }
                            .padding(12)
                            .padding(.horizontal, 30)
                            .background(.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .alert(isPresented: $showAlert){
                                Alert(title: Text(self.alertTitle), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .padding()
                    }
                    
                    if (passwordConfirm){
                        VStack {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(spacing: 16) {
                                    ZStack {
                                        Circle()
                                            .frame(width: 66, height: 66, alignment: .center)
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 24, weight: .medium, design: .rounded))
                                    }
                                    .frame(width: 66, height: 66, alignment: .center)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Password Verification")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                            .bold()
                                    }
                                    Spacer()
                                }
                                
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.white.opacity(0.1))
                                
                                HStack {
                                    
                                    TextField("Verification Code".uppercased(), text:$password_reset_code)
                                        .keyboardType(.numberPad)
                                        .font(.subheadline)
                                        .padding(.leading)
                                        .frame(height:44)
                                        .foregroundColor(.black)
                                        .onTapGesture {
                                            self.isFocused = true
                                        }
                                    Spacer()
                                    TextField("new password".uppercased(), text:$newPassword)
                                        .keyboardType(.default)
                                        .font(.subheadline)
                                        .padding(.leading)
                                        .frame(height:44)
                                        .foregroundColor(.black)
                                        .onTapGesture {
                                            self.isFocused = true
                                        }
                                }
                                
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.white.opacity(0.1))
                                
                            }
                            .padding(16)
                            
                            GradientButton(buttonTitle: "Submit"){
                                self.confirmResetPassword(email: email, newPassword: newPassword, confirmationCode: password_reset_code)
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom)
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white.opacity(0.2))
                                        .background(VisualEffectBlur(blurStyle: .dark))
                        )
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .offset(y:250)
                    }
                    
                    if (showConfirm) {
                        VStack {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(spacing: 16) {
                                    ZStack {
                                        Circle()
                                            .frame(width: 66, height: 66, alignment: .center)
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 24, weight: .medium, design: .rounded))
                                    }
                                    .frame(width: 66, height: 66, alignment: .center)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Email Verification")
                                            .foregroundColor(.black)
                                            .font(.title2)
                                            .bold()
                                    }
                                    Spacer()
                                }
                                
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.white.opacity(0.1))
                                
                                HStack {
                                    
                                    TextField("Verification Code".uppercased(), text:$verification_code)
                                        .keyboardType(.numberPad)
                                        .font(.subheadline)
                                        .padding(.leading)
                                        .frame(height:44)
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .onTapGesture {
                                            self.isFocused = true
                                        }
                                    Spacer()
                                }
                                
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.white.opacity(0.1))
                                
                            }
                            .padding(16)
                            
                            GradientButton(buttonTitle: "resend verification code"){
                                self.resendVerification()
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom)
                            
                            GradientButton(buttonTitle: "Submit"){
                                self.confirmSignUp()
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom)
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white.opacity(0.2))
                                        .background(VisualEffectBlur(blurStyle: .dark))
                        )
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .offset(y:250)
                    }
                    
                }
                .offset(y:isFocused ? -300 : 0)
                .animation(isFocused ? .easeInOut : nil)
                .onTapGesture {
                    self.isFocused = false
                    self.hideKeyboard()
                }
            }
            
            
            if (isLoading) {
                LoadingView()
            }
            
            if (isSuccessful) {
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    @State var show = false
    @EnvironmentObject var user:UserStore
    
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)
                Spacer()
                Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                    .resizable()
                    .frame(width: 36, height: 36)
                Spacer()
                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Circle())
                    .onTapGesture {
                        self.user.showLogin = false
                    }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            Text("Share Recipe & Get Healthy.\nFrom Now!!!")
            .font(.system(size:24, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: 375, maxHeight: 100)
            .padding(.horizontal, 16)
            
            Text("Everyone is waiting for your excellent recipe!!!")
                .font(.subheadline)
                .frame(width: 250)
                .foregroundColor(.black)
            LottieView(filename: "login")
                .padding(.bottom)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .frame(height: 477)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}
