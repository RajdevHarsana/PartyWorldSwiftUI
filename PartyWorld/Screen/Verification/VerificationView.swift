//
//  VerificationView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 06/06/22.
//

import SwiftUI

struct VerificationView: View {
    
    @Binding var isComeFrom: Bool
    var phoneOrEmail : String
    var userID : Int
    
    @StateObject var viewModel = ViewModel()
    @State var isFocused = false
    @State var isVerifiy = false
    @State var isResend = false
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    @ViewBuilder
    var destinationView: some View {
        if isComeFrom == true {
            NewPasswordView()
        }else {
            LoginView(isComeFrom: true)
        }
    }
    
    
    let textBoxWidth = UIScreen.main.bounds.width / 6
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 10
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment:.top){
                    
                    Color("rosa")
                    Button(action:{
                        isBack.toggle()
                    }){
                        Image("backWhite")
                    }
                    .frame(width: 26, height: 26)
                    .padding(.top,95)
                    .position(x: 25, y: 55)
                    
                    VStack{
                        
                        Text("Verification")
                            .font(.custom("Satoshi-Bold", size: 26))
                            .foregroundColor(.white)
                        //                        .padding()
                        Spacer().frame(height:15)
                        VStack{
                            Text("Please verify with your Mobile Number by submitting the OTP sent on the same below.")
                                .kerning(1.2)
                                .multilineTextAlignment(.center)
                                .padding([.trailing,.leading], 34)
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color.white)
                        }
                        
                    }.padding(.top,86)
                }
                .listRowBackground(Color("rosa"))
                .ignoresSafeArea()
                .frame(height: 170)
                .padding(.top,0)
                
                Spacer().frame(height:30)
                
                VStack{
                    ZStack{
                        HStack (spacing: spaceBetweenBoxes){
                            otpText(text: viewModel.otp1)
                            otpText(text: viewModel.otp2)
                            otpText(text: viewModel.otp3)
                            otpText(text: viewModel.otp4)
                            otpText(text: viewModel.otp5)
                        }
                        TextField("", text: $viewModel.otpField)
                            .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                            .disabled(viewModel.isTextFieldDisabled)
                            .textContentType(.oneTimeCode)
                            .foregroundColor(.clear)
                            .accentColor(.clear)
                            .background(Color.clear)
                            .keyboardType(.numberPad)
                        
                    }
                }
                Spacer().frame(height:40)
                Text("\(viewModel.timeStr)")
                    .foregroundColor(Color("lightGray"))
                    .onReceive(viewModel.timer) { _ in
                        viewModel.countDownString()
                    }
                Spacer().frame(height:40)
                
                NavigationLink(destination: destinationView, isActive: $viewModel.isVerified){
                    Button(action:{
                        viewModel.isVerified.toggle()
//                        verifyOtp()
                    }){
                        Text("Continue")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                            .background(Color("rosa"))
                            .cornerRadius(8)
                            .font(.custom("Satoshi-Medium", size: 18))
                            .foregroundColor(.white)
                    }
                }
                Spacer().frame(height:20)
                HStack{
                    Text("I didn't receive the code!")
                        .foregroundColor(Color("dark"))
                        .font(.custom("Satoshi-Medium", size: 14))
                    Spacer().frame(width:3)
                    Button(action:{
//                        viewModel.startTimer()
                        isResend = true
                        resendOtp()
                    }){
                        Text("Resend")
                            .frame(alignment:.center)
                            .foregroundColor(Color("rosa"))
                            .font(.custom("Satoshi-Regular", size: 14))
                    }.frame(alignment:.center)
                }
                Spacer()
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
    
    private func otpText(text: String) -> some View {
        return Text(text)
            .font(.title)
            .frame(width: textBoxWidth, height: textBoxHeight)
            .background(VStack{
                //                Spacer()
                //                Color("rosa")
                if text == "" {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(height: 60)
                        .foregroundColor(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                }else{
                    RoundedRectangle(cornerRadius: 1)
                        .frame(height: 60)
                        .foregroundColor(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("rosa"), lineWidth: 1))
                }
                
            })
        
        //            .padding(paddingOfBox)
    }
    private func resendOtp(){
        viewModel.resendOtpRequest(phoneNum: phoneOrEmail, is_resend: !isComeFrom ? 1 : 2, otp_for: !isComeFrom ? 1 : 2)
    }
    
    private func verifyOtp(){
        viewModel.verifyOtpRequest(userID: userID, oTP: viewModel.otpField)
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView(isComeFrom: .constant(true), phoneOrEmail: "", userID: 0)
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil)
    }
}
