//
//  CardGameOneView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//
import SwiftUI


struct CardGameOneView: View {
    @State var card: CardGameOne
    @Binding var hiddenCardIDs: Set<Int>
    @Binding var blurredCardIDs: Set<Int>


    var isBlurred: Bool {
        blurredCardIDs.contains(card.id)
    }
    var isHidden: Bool {
        hiddenCardIDs.contains(card.id)
    }

    var body: some View {
        ZStack {
            
            
            
            
            
            if isBlurred && !isHidden {
                Image(card.imageName)
                    .resizable()
                    .frame(width: 210, height: 210)
                    .background(Color.clear)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.green, lineWidth: 2)
                    ).opacity(0.5)


            }else if !isHidden && !isBlurred {
                Image(card.imageName)
                    .resizable()
                    .frame(width: 200, height: 180)
                    .background(Color.clear)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 2)
                    )

            } else {
                
                Image("")
                    .resizable()
                    .frame(width: 200, height: 180)
                    .background(Color.clear)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    
            }
        }.shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}


struct CardGameOneView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameOneView(card: CardGameOne(id: 1, correctIndex: 0, imageName: "albero"), hiddenCardIDs: .constant([]) , blurredCardIDs: .constant([]))
    }
}
