//
//  MainMenu.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/8/23.
//

import SwiftUI
import MapKit

struct MainMenu: View {
    
    @State var selectedAddress: String = ""
    let addresses = ["UTA", "UTD", "Walmart", "AT&T Stadium"]
    @State private var selectedLot: String = ""
    @State private var showLotView: Bool = false
    @State private var showFaculty1View: Bool = false
    @State private var isActionSheetVisible: Bool = false
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                Text("Choose your destination!")
                    .font(.custom("Gilgan", size: 25)) // Adjusted the size
                    .foregroundStyle(.black)
                    .padding(.bottom, 100) // Adjusted the padding to make it more centered
                    .padding(.top, 120)
                    .bold()
                
                Picker(selection: $selectedAddress, label:
                        HStack {
                            Text(selectedAddress.isEmpty ? "Select Address" : selectedAddress)
                                .foregroundColor(.white) // Made the text white for better visibility on black background
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "arrow.down.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35) // Made the arrow even slightly bigger
                                .padding(.trailing)
                        }
                        .frame(height: 60) // Increased height
                        .background(Color.black) // Made background black
                        .clipShape(RoundedRectangle(cornerRadius: 12)) // Increased corner radius slightly
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black.opacity(0.9)))
                        .padding(.horizontal)
                ) {
                    ForEach(addresses, id: \.self) { address in
                        Text(address).tag(address)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                .onChange(of: selectedAddress) { newValue in
                    if newValue == "UTA" {
                        showLotView = true
                    }
                }
                .fullScreenCover(isPresented: $showLotView, content: {
                                    LotView(lotName: selectedLot)
                                })
                                
                                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .padding(16)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                        .contextMenu {
                        ForEach(["Lot 49", "Lot 50", "Lot 52", "Lot F10"], id: \.self) { lot in
                        Button(action: {
                        selectedLot = lot
                        if lot == "Lot 49" {
                            showFaculty1View = true
                        } else {
                            showLotView = true
                                        }
                            }) {
                            Text(lot)
                        }
                  }
            }
                .padding()
                .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 120)
            }
                    }
                    .fullScreenCover(isPresented: $showFaculty1View, content: {
                        // Your custom view for Faculty 1
                        Faculty1View()
                    })
                }
            }

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
