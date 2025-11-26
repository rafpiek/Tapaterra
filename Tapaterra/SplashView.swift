import SwiftUI

struct SplashView: View {
    @EnvironmentObject var splashState: SplashStateManager
    @EnvironmentObject var languageManager: LanguageManager
    @State private var isAnimating = false
    @State private var flagScale: CGFloat = 0.1
    @State private var flagRotation: Double = 0
    @State private var flagOpacity: [Double] = Array(repeating: 0, count: 10)
    @State private var flagRotations: [Double] = Array(repeating: 0, count: 10)
    @State private var flagScales: [CGFloat] = Array(repeating: 0.1, count: 10)
    @State private var titleOpacity: Double = 0
    @State private var titleScale: CGFloat = 0.8
    @State private var starsOffset: CGFloat = 0

    // Array of flags from different regions
    private let flags = [
        FlagAssets.NorthAmerica.unitedStates,
        FlagAssets.Europe.poland,
        FlagAssets.Asia.japan,
        FlagAssets.SouthAmerica.brazil,
        FlagAssets.Africa.southAfrica,
        FlagAssets.Europe.france,
        FlagAssets.Asia.india,
        FlagAssets.NorthAmerica.canada,
        FlagAssets.Oceania.australia,
        FlagAssets.SouthAmerica.argentina
    ]

    private var flagNames: [String] {
        return [
            "countries.usa".localized,
            "countries.poland".localized,
            "countries.japan".localized,
            "countries.brazil".localized,
            "countries.south_africa".localized,
            "countries.france".localized,
            "countries.india".localized,
            "countries.canada".localized,
            "countries.australia".localized,
            "countries.argentina".localized
        ]
    }

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
                VStack(spacing: 30) {
                    // Circular flags container
                    ZStack {
                        ForEach(Array(flags.enumerated()), id: \.offset) { index, flag in
                            let angle = Double(index) * (360.0 / Double(flags.count))
                            let radius = min(geometry.size.width, geometry.size.height) * 0.25
                            let x = cos(angle * .pi / 180) * radius
                            let y = sin(angle * .pi / 180) * radius

                            VStack(spacing: 4) {
                                flag
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 35)
                                    .shadow(color: .white.opacity(0.4), radius: 8, x: 3, y: 3)
                                    .scaleEffect(flagScales[index])
                                    .rotationEffect(.degrees(flagRotations[index]))
                                    .opacity(flagOpacity[index])
                                    .animation(
                                        .spring(response: 1.8, dampingFraction: 0.7).delay(Double(index) * 0.15),
                                        value: flagScales[index]
                                    )
                                    .animation(
                                        .spring(response: 2.0, dampingFraction: 0.6).delay(Double(index) * 0.15),
                                        value: flagRotations[index]
                                    )
                                    .animation(
                                        .easeInOut(duration: 1.2).delay(0.5 + Double(index) * 0.1),
                                        value: flagOpacity[index]
                                    )

                                Text(flagNames[index])
                                    .font(.system(size: 8, weight: .medium))
                                    .foregroundColor(.white.opacity(0.9))
                                    .opacity(flagOpacity[index])
                                    .animation(
                                        .easeInOut(duration: 1.0).delay(0.8 + Double(index) * 0.1),
                                        value: flagOpacity[index]
                                    )
                            }
                            .offset(x: x, y: y)
                        }

                        // Center decoration
                        VStack {
                            Circle()
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                                        .opacity(titleOpacity > 0 ? 1.0 : 0.0)
                                        .animation(.easeInOut(duration: 2.0).delay(1.0), value: titleOpacity)
                                )
                                .opacity(titleOpacity > 0 ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 1.5).delay(1.0), value: titleOpacity)

                            Text("splash.flags".localized)
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.white.opacity(0.8))
                                .opacity(titleOpacity)
                                .animation(.easeInOut(duration: 1.5).delay(1.2), value: titleOpacity)
                        }
                    }
                    .frame(height: min(geometry.size.width, geometry.size.height) * 0.5)

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
                        Text("splash.app_title".localized)
                            .font(.system(size: 42, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .white.opacity(0.4), radius: 8, x: 0, y: 0)
                            .scaleEffect(titleScale)
                            .opacity(titleOpacity)
                            .animation(.spring(response: 1.8, dampingFraction: 0.7).delay(1.0), value: titleScale)
                            .animation(.easeInOut(duration: 1.5).delay(1.0), value: titleOpacity)

                        // Subtitle
                        Text("splash.subtitle".localized)
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

        // Animate all flags in a cascading pattern
        for index in 0..<flags.count {
            let delay = Double(index) * 0.15

            // Scale animation
            withAnimation(.spring(response: 1.8, dampingFraction: 0.7).delay(delay)) {
                flagScales[index] = 1.0
            }

            // Rotation animation
            withAnimation(.spring(response: 2.0, dampingFraction: 0.6).delay(delay)) {
                flagRotations[index] = index % 2 == 0 ? 360 : -360
            }

            // Opacity animation
            withAnimation(.easeInOut(duration: 1.2).delay(0.5 + delay)) {
                flagOpacity[index] = 1.0
            }
        }

        // Animate title
        withAnimation(.easeInOut(duration: 1.5).delay(1.0)) {
            titleOpacity = 1.0
            titleScale = 1.0
        }

        // Transition to main content after 6 seconds (longer for more flags)
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            splashState.showMainApp()
        }
    }
}

#Preview("English") {
    SplashView()
        .environmentObject(SplashStateManager())
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("Polish") {
    SplashView()
        .environmentObject(SplashStateManager())
        .environment(\.locale, .init(identifier: "pl"))
}