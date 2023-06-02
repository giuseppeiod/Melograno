//
//  GridView.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

//import SwiftUI
//
//struct GridView<Content: View>: View {
//    private let columns: Int
//    private let content: () -> Content
//    
//    init(columns: Int, @ViewBuilder content: @escaping () -> Content) {
//        self.columns = columns
//        self.content = content
//    }
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView {
//                LazyVGrid(columns: createColumns(with: geometry), spacing: 20) {
//                    content()
//                }
//                .padding()
//            }
//        }
//    }
//    
//    private func createColumns(with geometry: GeometryProxy) -> [GridItem] {
//        var gridItems = [GridItem]()
//        
//        let totalSpacing = CGFloat(columns + 1) * 20 // Spacing between columns plus padding
//        let itemWidth = (geometry.size.width - totalSpacing) / CGFloat(columns)
//        
//        for _ in 0 ..< columns {
//            gridItems.append(GridItem(.fixed(itemWidth), spacing: 20))
//        }
//        
//        return gridItems
//    }
//}
