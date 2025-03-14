//
//  EmptyStateView.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 14/03/25.
//


import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill") // SF Symbol for illustration
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .opacity(0.8)

            Text("No Tasks Yet")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("You're all caught up! Take a moment to relax or add a new task to get started.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .padding()
    }
}
