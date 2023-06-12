//
//  FinishButtonView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI


struct FinishButtonView: View {
    
    var buttonText : String
    
    var body: some View {
        HStack{
            Text(buttonText)
                .foregroundColor(.white)
                .font(.custom("Figtree-SemiBold", size: dynamicWidth(40)))
        }
        .frame(width: dynamicWidth(256), height: dynamicHeight(82))
        .background(Color("violaApp"))
        .cornerRadius(dynamicWidth(20))
    }
}

struct FinishButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FinishButtonView(buttonText: "Completed!")
    }
}
