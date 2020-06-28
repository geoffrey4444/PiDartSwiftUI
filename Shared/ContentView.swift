//
//  ContentView.swift
//  Shared
//
//  Created by Geoffrey Lovelace on 6/26/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user_data: UserData
    
    func dart_or_darts() -> String {
        user_data.exponent_number_of_throws > 0.0 ? " darts." : " dart."
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("π Estimate")
                    .font(.headline)
                    .padding([.all])
                Text(String(user_data.pi_estimate)).padding(.all)
                Button(action: {
                    let pb = NSPasteboard.general
                    pb.clearContents()
                    pb.setString(String(user_data.pi_estimate), forType: NSPasteboard.PasteboardType.string)
                }) {Image(systemName: "doc.on.clipboard")}
                    .padding([.all])
                    .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {user_data.estimate_pi()}) {
                    Text("Estimate Pi")
                }.disabled(user_data.calculating)
                .padding([.all])
            }
            
            
            HStack {
                Text("Fewer darts (faster)")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Spacer()
                Text("More darts (more accurate)")
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing)
            }
            Slider(value: $user_data.exponent_number_of_throws, in: 0.0...8.0, step: 1.0)
                .padding([.leading, .bottom, .trailing])
            Text("The next estimate of π will throw "+String(Int(pow(10.0, user_data.exponent_number_of_throws)))+dart_or_darts() )
                .font(.subheadline)
                .padding(.bottom)
            ProgressView(value: user_data.progress)
                .padding([.leading, .bottom, .trailing])
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
