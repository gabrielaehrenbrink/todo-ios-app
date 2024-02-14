import SwiftUI
import Foundation

struct ContentView: View {
    @State private var todoItems = [
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
        TodoItem(userInput: "", isToggled: false),
    ]
    
    @State private var taskDetails: [UUID: String] = [:]

    var body: some View {
        NavigationView {
            ZStack {
                Image("todoimg2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)

                VStack {
                    Spacer().frame(height: 28)
                    HStack {
                        Spacer().frame(width: 170)
                        List {
                            ForEach(todoItems) { todoItem in
                                NavigationLink(
                                    destination: TodoDetailView(task: todoItem, details: $taskDetails[todoItem.id]),
                                    label: {
                                        HStack {
                                            TextField("Enter task", text: $todoItems[todoItems.firstIndex(of: todoItem)!].userInput)
                                                .padding(.leading, 0)
                                            Toggle("", isOn: $todoItems[todoItems.firstIndex(of: todoItem)!].isToggled)
                                        }
                                    })
                            }
                        }
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(16)
                        .frame(width: 330, height: 550)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
