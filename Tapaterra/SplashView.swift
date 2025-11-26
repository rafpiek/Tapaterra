import SwiftUI

struct SplashView: View {
    @EnvironmentObject var splashState: SplashStateManager
    @State private var isAnimating = false
    @State private var flagScale: CGFloat = 0.1
    @State private var flagRotation: Double = 0
    @State private var usaFlagOpacity: Double = 0
    @State private var polishFlagOpacity: Double = 0
    @State private var titleOpacity: Double = 0
    @State private var titleScale: CGFloat = 0.8
    @State private var starsOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.3),
                        Color(red: 0.2, green: 0.1, blue: 0.4),
                        Color(red: 0.3, green: 0.1, blue: 0.5)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                // Animated stars in background
                ForEach(0..<20, id: \.self) { index in
                    Circle()
                        .fill(Color.white.opacity(0.6))
                        .frame(width: CGFloat.random(in: 2...4))
                        .position(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        )
                        .opacity(isAnimating ? 0.8 : 0.2)
                        .animation(
                            Animation.easeInOut(duration: Double.random(in: 2...4))
                                .repeatForever(autoreverses: true)
                                .delay(Double(index) * 0.2),
                            value: isAnimating
                        )
                }

                // Main content
                VStack(spacing: 40) {
                    // Flags container
                    HStack(spacing: 30) {
                        // USA Flag
                        FlagAssets.NorthAmerica.unitedStates
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .shadow(color: .white.opacity(0.3), radius: 10, x: 5, y: 5)
                            .scaleEffect(flagScale)
                            .rotationEffect(.degrees(flagRotation))
                            .opacity(usaFlagOpacity)
                            .animation(.spring(response: 1.5, dampingFraction: 0.6), value: flagScale)
                            .animation(.spring(response: 1.5, dampingFraction: 0.6), value: flagRotation)
                            .animation(.easeInOut(duration: 1.0), value: usaFlagOpacity)

                        // Polish Flag
                        FlagAssets.Europe.poland
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .shadow(color: .white.opacity(0.3), radius: 10, x: 5, y: 5)
                            .scaleEffect(flagScale)
                            .rotationEffect(.degrees(-flagRotation))
                            .opacity(polishFlagOpacity)
                            .animation(.spring(response: 1.5, dampingFraction: 0.6).delay(0.3), value: flagScale)
                            .animation(.spring(response: 1.5, dampingFraction: 0.6).delay(0.3), value: flagRotation)
                            .animation(.easeInOut(duration: 1.0).delay(0.3), value: polishFlagOpacity)
                    }

                    // App title with decorative elements
                    VStack(spacing: 15) {
                        // Decorative line
                        HStack {
                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height: 2)
                                .scaleEffect(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.0), value: titleOpacity)

                            Circle()
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 8, height: 8)
                                .scaleEffect(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.2), value: titleOpacity)

                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height: 2)
                                .scaleEffect(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.0), value: titleOpacity)
                        }

                        // Main title
                        Text("Tapaterra")
                            .font(.system(size: 42, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .white.opacity(0.4), radius: 8, x: 0, y: 0)
                            .scaleEffect(titleScale)
                            .opacity(titleOpacity)
                            .animation(.spring(response: 1.8, dampingFraction: 0.7).delay(1.0), value: titleScale)
                            .animation(.easeInOut(duration: 1.5).delay(1.0), value: titleOpacity)

                        // Subtitle
                        Text("Explore the World's Flags")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.8))
                            .opacity(titleOpacity)
                            .animation(.easeInOut(duration: 1.5).delay(1.5), value: titleOpacity)

                        // Decorative line
                        HStack {
                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height: 2)
                                .scaleEffect(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.3), value: titleOpacity)

                            Circle()
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 8, height: 8)
                                .scaleEffect(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.5), value: titleOpacity)

                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height: 2)
                                .scaleEffect(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.3), value: titleOpacity)
                        }
                    }

                    // Loading indicator
                    HStack(spacing: 4) {
                        ForEach(0..<3) { index in
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                                .scaleEffect(isAnimating ? 1.2 : 0.8)
                                .opacity(isAnimating ? 1.0 : 0.4)
                                .animation(
                                    Animation.easeInOut(duration: 0.8)
                                        .repeatForever()
                                        .delay(Double(index) * 0.2),
                                    value: isAnimating
                                )
                        }
                    }
                    .opacity(titleOpacity)
                    .animation(.easeInOut(duration: 1.0).delay(2.0), value: titleOpacity)
                }
                .onAppear {
                    startAnimations()
                }
            }
        }
    }

    private func startAnimations() {
        isAnimating = true

        // Animate flags
        withAnimation(.spring(response: 1.5, dampingFraction: 0.6)) {
            flagScale = 1.0
            flagRotation = 360
        }

        withAnimation(.easeInOut(duration: 1.0).delay(0.5)) {
            usaFlagOpacity = 1.0
        }

        withAnimation(.easeInOut(duration: 1.0).delay(0.8)) {
            polishFlagOpacity = 1.0
        }

        // Animate title
        withAnimation(.easeInOut(duration: 1.5).delay(1.0)) {
            titleOpacity = 1.0
            titleScale = 1.0
        }

        // Transition to main content after 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            splashState.showMainApp()
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(SplashStateManager())
}