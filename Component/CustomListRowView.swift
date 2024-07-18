//
//  CustomListRowView.swift
//  Hike
//
//  Created by Camilo Moreno on 17/07/24.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent{
            //Content
            Text(rowContent!)
                .foregroundStyle(.primary)
                .fontWeight(.heavy)
        }label:{
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
        CustomListRowView(
            rowLabel: "Designer",
            rowIcon: "paintpalette",
            rowContent: "John Doe",
            rowTintColor: .pink)
    }
}
