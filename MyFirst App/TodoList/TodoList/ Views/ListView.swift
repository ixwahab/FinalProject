//
//  ListView.swift
//  TodoList
//
//  Created by Abdulwahab Alqallaf on 28/03/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewModel: ListViewModel
    @State var items: [ItemModel] = [
    ItemModel(title: "This is the first title!", isCompleted: false),
    ItemModel(title: "Thsi is the second!", isCompleted: true),
    ItemModel(title: "Third!", isCompleted: false),
    ]
    
    
    var body: some View {
        ZStack{
            if listviewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else{
                List{
                    ForEach(listviewModel.items) { item in
                      ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listviewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listviewModel.deleteItem)
                    .onMove(perform: listviewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
             leading: EditButton(),
             trailing:
                NavigationLink("Add",destination: AddView())
                )
    }
    

    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
       
    }
}
