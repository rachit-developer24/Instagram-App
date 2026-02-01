//
//  IGInputField.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 29/01/2026.
//

import SwiftUI
struct IGInputField<E:Error>: View {
    @Binding var text:String
    @Binding var error:E?
    let isloading:Bool
    let placeholder:String
    let securefield:Bool
    init(text: Binding<String>,placeholder: String,securefield:Bool)where E == Never {
        _text = text
        _error = .constant(nil)
        self.isloading = false
        self.placeholder = placeholder
        self.securefield = securefield
    }
    init (text: Binding<String>,error: Binding<E?>,isloading:Bool,placeholder: String,securefield:Bool) {
        _text = text
        _error = error
        self.isloading = isloading
        self.placeholder = placeholder
        self.securefield = securefield
    }
    var body: some View {
        VStack(alignment:.leading){
            if securefield{
                ZStack(alignment:.trailing){
                    SecureField(placeholder,text: $text)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    if isloading{
                        ProgressView()
                            .padding(.trailing)
                    }
                    if error != nil{
                        Button {
                            text = ""
                            error = nil
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .foregroundStyle(.red)
                        }
                        .padding(.trailing)

                    }
                        
                }
                if let error = error{
                    Text(error.localizedDescription)
                        .foregroundStyle(.red)
                        .fontWeight(.semibold)
                        .font(.footnote)
                }

            }else{
                ZStack(alignment:.trailing){
                    TextField(placeholder,text: $text)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    if isloading{
                        ProgressView()
                            .padding(.trailing)
                    }
                    if error != nil{
                        Button {
                            text = ""
                            error = nil
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .foregroundStyle(.red)
                        }
                        .padding(.trailing)

                    }
                        
                }
                if let error = error{
                    Text(error.localizedDescription)
                        .foregroundStyle(.red)
                        .fontWeight(.semibold)
                        .font(.footnote)
                }
            }
           
        }
    }
}

#Preview {
    IGInputField(text: .constant("Email"), placeholder: "", securefield: false)
    IGInputField(text: .constant("loading"), error:.constant(AuthenticationError.credentialAlreadyInUse) , isloading: true, placeholder: "", securefield: false)
    IGInputField(text: .constant("Error"), error:.constant(NSError(domain: "", code: -1)), isloading: false, placeholder: "", securefield: false)
}
