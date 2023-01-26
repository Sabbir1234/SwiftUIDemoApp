//
//  HomeView.swift
//  Restart
//
//  Created by Sabbir Hossain on 16/11/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            Spacer()
            Image("character-2").resizable().scaledToFit().padding()
            
            // MARK: - CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus").font(.title3).fontWeight(.light).foregroundColor(.secondary).multilineTextAlignment(.center).padding()
            
            // MARK: - FOOTER
            Spacer()
            Button {
                isOnboardingViewActive = true
                debugPrint("Restart Button tapped")
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Restart").font(.system(.title3, design: .rounded)).fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        }        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
