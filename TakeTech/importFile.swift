//
//  importFile.swift
//  macro
//
//  Created by Nada on 13/11/1443 AH.
//

import SwiftUI
import UniformTypeIdentifiers
struct importFile: View {
    @State private var text: String = ""
    @State private var showImporter = false
    @State private var textInFiles = [String]()
    @State var years = ""
    @State var description = ""
    @State var major : String = "1"
    @State var majors: [String] = [ "Information Technology" ,"Computer Science" ,"Information System", "Internet Of Things", "Artificial Intelligence", "Cyber Security", "Data Analysis", "Software Engineering"]
    
    var body: some View {
        NavigationView{
        
            
            VStack{
                
                Form{
                    Section {
                        TextField("",text: $years)
                    } header: {
                        Text("Years of Experiance*")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 4.0)
                    }
                    Section {
                        Picker( selection: $major){
                            ForEach(majors, id:\.self){ majors in Text(majors)}
                        } label: {
                            Text("")
                        }.pickerStyle(.menu)
                            .accentColor(.white)
                    } header: {
                        Text("Major / Proficiency*")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 4.0)
                    } footer: {
                        Text("* If you couldn't find your major please provide it at the description")
                    }
                    
                    Section {
                        TextEditor(text: $text)
                            .frame(width: 358, height: 125, alignment: .leading)
                        
                    }header: {
                        Text("Describe yourself*")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 4.0)
                    }
                }.frame(height: 460)
                    .padding(.bottom)
                // Import file button
                Text("UPLOAD ANY DOCUMENTS THAT APPROVE YOUR PROVIDED INFORMATION*")
                    .fontWeight(.bold)
                    .font(.system(size:12))
                    .frame(width: 358, height: 38, alignment: .leading)
                    .padding(.leading, 50.0)
                    .padding(.bottom, 8.0)
                
                Button("Import Files") {
                    showImporter = true
                }
                .fileImporter(isPresented: $showImporter,
                              allowedContentTypes: [.plainText],
                              allowsMultipleSelection: true) { result in
                    switch result {
                    case .failure(let error):
                        print("Error selecting file: \(error.localizedDescription)")
                    case .success(let urls):
                        textInFiles = []
                        for url in urls {
                            do {
                                if url.startAccessingSecurityScopedResource() {
                                    textInFiles.append(try String(contentsOf: url))
                                    url.stopAccessingSecurityScopedResource()
                                }
                            } catch let error {
                                print("Error reading file \(error.localizedDescription)")
                            }
                        }
                    }
                }.frame(width: 352, height: 110, alignment: .center)
                    .background(Color(red: 0.11, green: 0.11, blue: 0.118))
                    .cornerRadius(12)
                    .padding(.bottom)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                  Text("Create")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .frame(width: 285, height: 40, alignment: .center)
                            .background(.foreground)
                            .foregroundColor(.init("blue"))
                            .cornerRadius(6)
                }.padding(.bottom, 37.0)
               Spacer()
              
            }
            
            
      
       
        }
        
    }
}

struct importFile_Previews: PreviewProvider {
    static var previews: some View {
        importFile()
            .preferredColorScheme(.dark)
    }
}

