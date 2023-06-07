//
//  firstview.swift
//  MelogranoProject
//
//  Created by Francesco on 07/06/23.
//

import SwiftUI

struct firstview: View {
    var body: some View {
        ZStack{
            OnBoardingFirst()
            BoardingSecond()
        }
    }
}

struct firstview_Previews: PreviewProvider {
    static var previews: some View {
        firstview()
    }
}
