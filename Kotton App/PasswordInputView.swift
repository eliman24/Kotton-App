//
//  InputFieldView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/23/23.
//

import SwiftUI

struct PasswordInputView: View {
    @Binding var data: String
    var title: String?
    
    var body: some View {
      ZStack {
        SecureField("", text: $data)
          .padding(.horizontal, 10)
          .frame(height: 42)
          .overlay(
            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                .stroke(Color.gray, lineWidth: 1)
          )
        HStack {                    // HStack for the text
          Text(title ?? "Input")
            .font(.headline)
            .fontWeight(.thin)      // making the text small
            .foregroundColor(Color("spring"))
            .multilineTextAlignment(.leading)
            .padding(4)
            .background(Color("forest"))
            Spacer()
        }
        .padding(.leading, 8)
        .offset(CGSize(width: 0, height: -20))  // pushign the text up to overlay the border of the input field
      }.padding(4)
    }
}

struct PasswordInputView_Previews: PreviewProvider {
    @State static var data: String = ""
    
    static var previews: some View {
        PasswordInputView(data: $data, title: "Password")
    }
}
