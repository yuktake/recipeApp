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
                self.alertMessage = "error"
                self.showAlert = true
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
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
    
    func resendVerification() {
//        Amplify.Auth.resendSignUpCode(for: username, listener: { result in
        Amplify.Auth.resendSignUpCode(for: email, listener: { result in
            switch result {
            case .success(let result):
                print("Resend code success \(result)")
            case  .failure(let error):
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
                self.passwordConfirm = false
            case .failure(let error):
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
            }
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView {
                ZStack(alignment: .top) {
//                    Color("background2")
//                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                        .edgesIgnoringSafeArea(.bottom)
                    VStack {
                        CoverView()
                        
                        VStack {
//                            if !loginButton && !forgotButton {
//                                HStack {
//                                    Image(systemName: "person.crop.circle")
//                                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
//                                        .frame(width:44, height: 44)
//                                        .background(Color.white)
//                                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
//                                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
//                                        .padding(.leading)
//                                    TextField("Your Username".uppercased(), text:$username)
//                                        .keyboardType(.emailAddress)
//                                        .font(.subheadline)
//                                        .padding(.leading)
//                                        .frame(height:44)
//                                        .onTapGesture {
//                                            self.isFocused = true
//                                        }
//                                }
//
//                                Divider().padding(.leading, 80)
//                            }
                            
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
                            
                            if !forgotButton {
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
                                        .foregroundColor(.black)
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
                                }
                            } else {
                                Button(action: {
                                    self.forgotButton.toggle()
                                    if (forgotButton) {
                                        buttonText = "Send"
                                        formHeight = 68
                                    } else {
                                        buttonText = "Signup"
                                        formHeight = 136
                                    }
                                }){
                                    Text(self.forgotButton ? "Signup" : "Resend Verification?")
                                        .font(.subheadline)
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
                            .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color:Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3),radius: 20, x:0, y:20)
                            .alert(isPresented: $showAlert){
                                Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
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
//                                            .foregroundColor(Color("pink-gradient-1"))
                                            .frame(width: 66, height: 66, alignment: .center)
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.white)
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
                                        .background(Color.white)
                                        .onTapGesture {
                                            self.isFocused = true
                                        }
                                    Spacer()
                                    TextField("new password".uppercased(), text:$newPassword)
                                        .keyboardType(.default)
                                        .font(.subheadline)
                                        .padding(.leading)
                                        .frame(height:44)
                                        .background(Color.white)
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
//                                        .background(Color("secondaryBackground").opacity(0.5))
                                        .background(VisualEffectBlur(blurStyle: .dark))
//                                        .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
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
//                                            .foregroundColor(Color("pink-gradient-1"))
                                            .frame(width: 66, height: 66, alignment: .center)
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .medium, design: .rounded))
                                    }
                                    .frame(width: 66, height: 66, alignment: .center)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Email Verification")
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
                                    
                                    TextField("Verification Code".uppercased(), text:$verification_code)
                                        .keyboardType(.numberPad)
                                        .font(.subheadline)
                                        .padding(.leading)
                                        .frame(height:44)
                                        .background(Color.white)
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
//                                        .background(Color("secondaryBackground").opacity(0.5))
                                        .background(VisualEffectBlur(blurStyle: .dark))
//                                        .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
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
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text("Learn design & code.\nFrom scratch")
                    .font(.system(size:geometry.size.width/10, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: 375, maxHeight: 100)
            .padding(.horizontal, 16)
            .offset(x: viewState.width/15, y:viewState.height/15)
            
            Text("80 hours of courses for SwiftUI, React and design tools")
                .font(.subheadline)
                .frame(width: 250)
                .foregroundColor(.black)
                .offset(x: viewState.width/20, y:viewState.height/20)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top, 100)
        .frame(height: 477)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
//                Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
                
//                Image(uiImage: #imageLiteral(resourceName: "Blob"))
//                    .offset(x: -150, y:-200)
//                    // 元の位置に戻すため
//                    .rotationEffect(Angle(degrees: show ? 450 : 90))
//                    .blendMode(.plusDarker)
//                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
//                    .onAppear{self.show = true}
//                Image(uiImage: #imageLiteral(resourceName: "Blob"))
//                    .offset(x:-200, y:-250)
//                    .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
//                    .blendMode(.overlay)
//                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
            }
        )
        .background(
//            Image(uiImage: #imageLiteral(resourceName: "Card3"))
            LottieView(filename: "login")
//                .offset(x: viewState.width/25, y:viewState.height/25)
            , alignment: .bottom)
        .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .scaleEffect(isDragging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1,duration:0.8))
        .rotation3DEffect(
            Angle(degrees: 5),
            axis: (x: viewState.width, y: viewState.height, z: 0))
        .gesture(DragGesture().onChanged{ value in
            self.viewState = value.translation
            self.isDragging = true
        }
        .onEnded{ value in
            self.viewState = .zero
            self.isDragging = false
        })
    }
}
