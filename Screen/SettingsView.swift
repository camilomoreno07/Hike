//
//  SettingsView.swift
//  Hike
//
//  Created by Camilo Moreno on 4/07/24.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire",
    ]
    
    var body: some View {
        List{
            // MARK: - SECTION: HEADER
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight, .customGreenMedium , .customGreenDark], startPoint: .top, endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find the \nperfect tracks?")
                        .font(.title2)
                    .fontWeight(.heavy)
                
                
                Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                    .font(.footnote)
                    .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            
            Section(
                header: Text("ALTERNATE ICONS")){
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 12) {
                            ForEach(alternateAppIcons.indices, id: \.self) { item in
                                Button{
                                    print("Sexo anal")
                                    
                                    UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                        if error != nil{
                                            print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                        }else{
                                            print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                        }
                                    }
                                }label: {
                                    Image("\(alternateAppIcons[item])-Preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 80)
                                        .cornerRadius(16)
                                }
                            .buttonStyle(.borderless)
                            }
                        }
                    }//: SCROLLVIEW
                    .padding(.top, 12)
                    
                    Text("Choose your favorite app icon from the collection above.")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                        .padding(.bottom, 12)
                
            }//: SECTION
                .listRowSeparator(.hidden)
            
            
            // MARK: - SECTION: ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyrigh © All rights reserved")
                    Spacer()
                }
                .padding(.vertical,8)
            ){
                
                //2. Advanced Labeled Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Camilo Moreno", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "Robert Petras", rowTintColor: .pink)
                
                
            }//: SECTION
        }//: LIST
        
    }
}

#Preview {
    SettingsView()
}
