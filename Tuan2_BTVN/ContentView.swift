import SwiftUI

struct ContentView: View {
    let employees = ["Nguyen Van A", "Nguyen Van B", "Nguyen Van C"]
    
    @State private var employeeName: String = UserDefaults.standard.string(forKey: "currentEmployee") ?? "Nguyen Van A"
    @State private var bookName: String = ""
    @State private var bookList: [String] = UserDefaults.standard.stringArray(forKey: "bookList") ?? ["Sách 01", "Sách 02"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Hệ thống Quản lý Thư viện")
                .font(.title2)
                .bold()
                .padding(.top, 20)

            // Nhân viên
            VStack(alignment: .leading, spacing: 8) {
                Text("Nhân viên")
                    .font(.headline)

                HStack {
                    Text(employeeName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)

                    Button("Đổi") {
                        changeEmployee()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)

            // Nhập sách mới
            VStack(alignment: .leading, spacing: 8) {
                Text("Nhập tên sách mới")
                    .font(.headline)

                HStack {
                    TextField("Nhập tên sách", text: $bookName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Thêm") {
                        addBook()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)

            // Danh sách sách
            VStack(alignment: .leading, spacing: 8) {
                Text("Danh sách sách")
                    .font(.headline)

                VStack {
                    ForEach(bookList, id: \.self) { book in
                        bookItem(title: book)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .padding(.horizontal)

            Spacer()

            // Thanh điều hướng
            HStack {
                navItem(title: "Quản lý", isActive: true)
                navItem(title: "DS Sách", isActive: false)
                navItem(title: "Nhân viên", isActive: false)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
        }
    }

    // MARK: - Hàm đổi nhân viên
    func changeEmployee() {
        if let currentIndex = employees.firstIndex(of: employeeName) {
            let nextIndex = (currentIndex + 1) % employees.count
            employeeName = employees[nextIndex]

            // Lưu vào UserDefaults
            UserDefaults.standard.set(employeeName, forKey: "currentEmployee")
        }
    }

    // MARK: - Hàm thêm sách
    func addBook() {
        let trimmedBook = bookName.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedBook.isEmpty {
            bookList.append(trimmedBook)
            bookName = ""

            // Lưu danh sách sách vào UserDefaults
            UserDefaults.standard.set(bookList, forKey: "bookList")
        }
    }

    // MARK: - Component danh sách sách
    func bookItem(title: String) -> some View {
        HStack {
            Image(systemName: "checkmark.square.fill")
                .foregroundColor(.red)

            Text(title)
                .font(.body)

            Spacer()
        }
        .padding(.vertical, 8)
    }

    // MARK: - Component điều hướng
    func navItem(title: String, isActive: Bool) -> some View {
        VStack {
            Image(systemName: "house.fill")
                .foregroundColor(isActive ? .blue : .gray)

            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

