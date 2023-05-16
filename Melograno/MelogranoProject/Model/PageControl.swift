//
//  PageControl.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    private let activeColor: Color = .blue
    private let inactiveColor: Color = .gray
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .foregroundColor(index == currentPage ? activeColor : inactiveColor)
                    .frame(width: 8, height: 8)
            }
        }
    }
}
