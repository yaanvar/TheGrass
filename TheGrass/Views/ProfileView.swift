//
//  ProfileView.swift
//  TheGrass
//
//  Created by Anvar Rakhimov on 15.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var user: User = User.dummyUser
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    cover
                }
            }
            .coordinateSpace(name: "scroll")
            .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        .zIndex(1)
    }
    
    var cover: some View {
        GeometryReader { reader in
            let scrollY = reader
                .frame(in: .named("scroll")).minY
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(
                banner
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY > 0 ? scrollY / 10 : 0)
            )
            .overlay(
                card
                    .offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: 130)
                    .padding(20)
                    .padding(.bottom, 20)
            )
        }
        .frame(height: UIScreen.main.bounds.width)
        .padding(.bottom, 50)
    }

    var banner: some View {
        Image(Assets.profileImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
    
    var card: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(user.fullName())
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary)
                .lineLimit(2)
            Text("@" + user.tag)
                .font(.subheadline).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary.opacity(0.7))
            Text(user.location)
                .font(.subheadline).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary.opacity(0.7))
            Text(user.description)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary.opacity(0.7))
        }
        .padding(20)
        .background(
            cardForm
        )
    }
    
    var cardForm: some View {
        Rectangle()
           .fill(.ultraThinMaterial)
           .cornerRadius(30)
           .shadow(radius: 5)
    }
}

#Preview {
    ProfileView()
}
