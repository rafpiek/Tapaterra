import SwiftUI

struct SplashView: View {
    var onComplete: () -> Void

    @State private var isAnimating = false
    @State private var flagOpacity: [Double] = Array(repeating: 0, count: 10)
    @State private var flagRotations: [Double] = Array(repeating: 0, count: 10)
    @State private var flagScales: [CGFloat] = Array(repeating: 0.1, count: 10)
    @State private var titleOpacity: Double = 0
    @State private var titleScale: CGFloat = 0.8

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

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.3),
                        Color(red: 0.2, green: 0.1, blue: 0.4),
                        Color(red: 0.3, green: 0.1, blue: 0.5)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                // Stars
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
                            .easeInOut(duration: Double.random(in: 2...4))
                                .repeatForever(autoreverses: true)
                                .delay(Double(index) * 0.2),
                            value: isAnimating
                        )
                }

                VStack(spacing: 30) {
                    // Circular flags
                    ZStack {
                        ForEach(Array(flags.enumerated()), id: \.offset) { index, flag in
                            let angle = Double(index) * (360.0 / Double(flags.count))
                            let radius = min(geometry.size.width, geometry.size.height) * 0.25
                            let x = cos(angle * .pi / 180) * radius
                            let y = sin(angle * .pi / 180) * radius

                            flag
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 35)
                                .shadow(color: .white.opacity(0.4), radius: 8)
                                .scaleEffect(flagScales[index])
                                .rotationEffect(.degrees(flagRotations[index]))
                                .opacity(flagOpacity[index])
                                .offset(x: x, y: y)
                        }

                        // Center globe
                        Image("globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .shadow(color: .white.opacity(0.5), radius: 12)
                            .scaleEffect(titleScale)
                            .opacity(titleOpacity)
                    }
                    .frame(height: min(geometry.size.width, geometry.size.height) * 0.5)

                    // Title
                    VStack(spacing: 15) {
                        Text(L10n.get("splash.app_title"))
                            .font(.system(size: 42, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .white.opacity(0.4), radius: 8)
                            .scaleEffect(titleScale)
                            .opacity(titleOpacity)

                        Text(L10n.get("splash.subtitle"))
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.8))
                            .opacity(titleOpacity)
                    }

                    // Loading dots
                    HStack(spacing: 4) {
                        ForEach(0..<3, id: \.self) { index in
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                                .scaleEffect(isAnimating ? 1.2 : 0.8)
                                .animation(
                                    .easeInOut(duration: 0.8)
                                        .repeatForever()
                                        .delay(Double(index) * 0.2),
                                    value: isAnimating
                                )
                        }
                    }
                    .opacity(titleOpacity)
                }
            }
        }
        .onAppear { startAnimations() }
    }

    private func startAnimations() {
        isAnimating = true

        for index in 0..<flags.count {
            let delay = Double(index) * 0.15
            withAnimation(.spring(response: 1.8, dampingFraction: 0.7).delay(delay)) {
                flagScales[index] = 1.0
            }
            withAnimation(.spring(response: 2.0, dampingFraction: 0.6).delay(delay)) {
                flagRotations[index] = index % 2 == 0 ? 360 : -360
            }
            withAnimation(.easeInOut(duration: 1.2).delay(0.5 + delay)) {
                flagOpacity[index] = 1.0
            }
        }

        withAnimation(.easeInOut(duration: 1.5).delay(1.0)) {
            titleOpacity = 1.0
            titleScale = 1.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            onComplete()
        }
    }
}

#Preview {
    SplashView { }
}
