import SwiftUI

// Splash Screen
struct SplashScreenView: View {
    @Binding var isActive: Bool  // Truyền trạng thái từ bên ngoài
    
    var body: some View {
        if isActive {
            OnboardingView() // Chuyển đến màn hình Onboarding
        } else {
            VStack {
                Spacer()
                Image("uth_logo") // Thay thế bằng tên hình ảnh logo trong Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text("UTH SmartTasks")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Spacer()
            }
            .onAppear {
                // Giả lập chuyển trang trong Preview
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true // Đặt trạng thái thành true sau 2 giây
                    }
                }
            }
        }
    }
}

// Onboarding Pages Structure
struct OnboardingPage {
    let title: String
    let description: String
    let imageName: String
}

// Onboarding View
struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var showWelcomeScreen = false  // Trạng thái để hiển thị màn hình Welcome

    let pages: [OnboardingPage] = [
        OnboardingPage(title: "Easy Time Management", description: "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first.", imageName: "first"),
        OnboardingPage(title: "Increase Work Effectiveness", description: "Time management and the determination of more important tasks will give your job statistics better and always improve.", imageName: "second"),
        OnboardingPage(title: "Reminder Notification", description: "The advantage of this application is that it also provides reminders for you so you don’t forget to keep doing your assignments well and according to the time you have set.", imageName: "third")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Dấu chấm tab view ở góc trái
                HStack {
                    ForEach(0..<pages.count) { index in
                        Circle()
                            .fill(currentPage == index ? Color.blue : Color.gray)
                            .frame(width: 8, height: 8)
                            .padding(3)
                    }
                    Spacer() // Đẩy dấu chấm sang trái
                }
                .padding(.top, 30)
                .padding(.leading, 20)
                
                // Hiển thị trang hiện tại
                VStack {
                    Image(pages[currentPage].imageName) // Thay thế hình ảnh dựa trên tên trong mảng pages
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.top, 90)
                    
                    Text(pages[currentPage].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text(pages[currentPage].description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
                
                // Nút quay lại và nút chuyển tiếp
                HStack {
                    if currentPage > 0 {
                        Button(action: {
                            currentPage -= 1
                        }) {
                            Image(systemName: "arrow.left.circle.fill") // Dấu mũi tên quay lại
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                        }
                        .padding(.leading, 10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if currentPage < pages.count - 1 {
                            currentPage += 1
                        } else {
                            // Sau khi hoàn thành Onboarding, chuyển sang màn hình chào mừng
                            showWelcomeScreen = true
                        }
                    }) {
                        Text(currentPage == pages.count - 1 ? "Get Started" : "Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                }
                .padding(.bottom, 40)
            }
            .padding()
            .overlay(
                // Chỉ giữ một nút Skip ở góc trên bên phải
                Button(action: {
                    showWelcomeScreen = true // Khi nhấn Skip, hiển thị màn hình Welcome
                }) {
                    Text("Skip")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding()
                }
                .padding(.top, 30)
                .padding(.trailing, 20),
                alignment: .topTrailing
            )
            .navigationDestination(isPresented: $showWelcomeScreen) {
                WelcomeScreenView() // Màn hình chào mừng
            }
        }
    }
}

// Màn hình Chào Mừng
struct WelcomeScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("uth_logo") // Thay thế bằng tên hình ảnh logo trong Assets
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("UTH SmartTasks")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Spacer()
            
            Button(action: {
                // Chuyển đến màn hình chính hoặc thực hiện hành động khác
            }) {
                Text("Get Started")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
        }
    }
}

// ContentView for Preview
struct ContentView: View {
    @State private var isSplashActive = false  // Trạng thái để điều khiển chuyển từ Splash sang Onboarding
    
    var body: some View {
        SplashScreenView(isActive: $isSplashActive)  // Truyền trạng thái vào SplashScreenView
            .onAppear {
                // Set trạng thái là false để hiển thị SplashScreen ban đầu
                isSplashActive = false
            }
    }
}




// Preview for SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Hiển thị splash screen trong Preview
            .previewDevice("iPhone 14") // Chọn thiết bị preview
            .preferredColorScheme(.light) // Chế độ sáng
    }
}
