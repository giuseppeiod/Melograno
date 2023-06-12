//
//  DimensionHelper.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import Foundation
import SwiftUI
func dynamicWidth(_ size:CGFloat) -> CGFloat{
    let screenWidth:CGFloat = UIScreen.main.bounds.size.width
    return size * screenWidth / 1366
}

func dynamicHeight(_ size:CGFloat) -> CGFloat{
    let screenHeigth:CGFloat = UIScreen.main.bounds.size.height
    return size * screenHeigth / 1024
}
