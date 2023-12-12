//
//  LotView.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/8/23.
//

import SwiftUI
import MapKit

struct CustomAnnotation: Identifiable {
    let id = UUID()
    let annotation: MKPointAnnotation
}

struct SpotStatus: Codable {
    let status: Bool
}

struct LotView: View {
    
    @State private var updateTimer: Timer? = nil
    
    @State private var isSpot1Occupied: Bool = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.7278641, longitude: -97.1117944),
        span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
    )
    
    let bodyData: [String: Any] = ["query": "status"]
    
    func fetchSpotStatus() {
        guard let url = URL(string: "https://hackapi-yrfe.onrender.com/spots/status") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyData: [String: Any] = ["id": "1"]
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            let decoder = JSONDecoder()
            if let spotStatus = try? decoder.decode(SpotStatus.self, from: data) {
                DispatchQueue.main.async {
                    self.isSpot1Occupied = spotStatus.status
                }
            }
        }
        .resume()
    }
    
    
    var annotations: [CustomAnnotation] = {
        var places = [CustomAnnotation]()
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 32.728, longitude: -97.114)
        places.append(CustomAnnotation(annotation: annotation1))
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 32.7285, longitude: -97.115)
        places.append(CustomAnnotation(annotation: annotation2))
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 32.7282, longitude: -97.1138)
        places.append(CustomAnnotation(annotation: annotation3))
        
        return places
    }()
    
    @State private var isFABMenuVisible: Bool = false
    @State private var showRedBoxes: Bool = false
    var lotName: String
    
    var body: some View {
        ZStack {
            // Gradient for the background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text(lotName)
                    .font(.title2)
                    .padding()
                
                Map(coordinateRegion: $region)
                    .frame(height: 200)
                
                if showRedBoxes {
                    HStack {
                        Rectangle()
                            .fill(isSpot1Occupied ? Color.red : Color.green) // Change color based on the status
                            .frame(width: 40, height: 40) // Made it longer as per your request
                            .overlay(Text("1").foregroundColor(.white))
                            .padding(5)
                        
                        ForEach(annotations.indices, id: \.self) { index in
                            VStack {
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 40, height: 60) // Made the boxes longer
                                    .padding(5)
                                
                                Text("\(index + 1)") // Numbering the boxes
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                Spacer()
                
                // FAB Menu items
                if isFABMenuVisible {
                    ForEach(["Student 1", "Student 2", "Faculty 1", "Faculty 2"], id: \.self) { lot in
                        Button(action: {
                            if lot == "Lot F10" {
                                withAnimation {
                                    region.center = CLLocationCoordinate2D(latitude: 32.728685, longitude: -97.114870)
                                    region.span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                                    showRedBoxes = true
                                }
                            } else {
                                showRedBoxes = false
                            }
                        }) {
                            Text(lot)
                                .padding()
                                .background(Color.white)
                                .clipShape(Capsule())
                                .shadow(radius: 2)
                        }
                        .padding(.bottom, 10)
                    }
                }
                
                // FAB Button
                Button(action: {
                    withAnimation {
                        isFABMenuVisible.toggle()
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .padding(16)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .padding(.bottom, 20)
            }
            .onAppear {
                // Start the timer to fetch the parking spot status every 10 seconds (or your preferred interval)
                updateTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
                    fetchSpotStatus()
                }
            }
            .onDisappear {
                // Invalidate the timer when the view disappears
                updateTimer?.invalidate()
                updateTimer = nil
            }
        }
    }
    
}
