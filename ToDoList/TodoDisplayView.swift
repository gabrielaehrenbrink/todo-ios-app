import SwiftUI

struct TodoDetailView: View {
    var task: TodoItem
    @Binding var details: String?

    @State private var taskInfo: String = ""

    var body: some View {
        VStack {
            Color(red: 102/255, green: 139/255, blue: 226/255)
                .ignoresSafeArea()

            Text("Task: \(task.userInput)")
                .font(.title)
                .foregroundColor(.white)

            Text("Status: \(task.isToggled ? "Completed" : "Incomplete")")
                .font(.subheadline)
                .foregroundColor(task.isToggled ? .white : .black)

            if let savedTaskInfo = details {
                Text("Task details: \(savedTaskInfo)")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color(red: 102/255, green: 139/255, blue: 226/255))
                    .cornerRadius(10)
            }

            TextField("Task Info", text: $taskInfo)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.body)

            Button("Submit") {
                saveTaskInfo()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Spacer().frame(height: 250)
        }
        .padding(20)
        .background(Color(red: 102/255, green: 139/255, blue: 226/255))
    }

    private func saveTaskInfo() {
        details = taskInfo
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(task: TodoItem(userInput: "Example Task", isToggled: false), details: .constant(nil))
    }
}
