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
    @State var colorBg = Color(#colorLiteral(red: 0.1730993092, green: 0.1771541238, blue: 0.1973441839, alpha: 1))
    @State var description = ""
    @State var major : String = "1"
    @State var majors: [String] = [ "Information Technology" ,"Computer Science" ,"Information System", "Internet Of Things", "Artificial Intelligence", "Cyber Security", "Data Analysis", "Software Engineering"]
    @State var fileUrlStrings: [URL] = []
    @State var selectedUrl: URL?
    @State var isShowingPDFView: Bool = false
    @EnvironmentObject var firebaseManager: FireBaseManager
    var body: some View {
        NavigationView{
            
            
            ScrollView{
                
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
                              allowedContentTypes: [.plainText, .pdf, .text, .item],
                              allowsMultipleSelection: true) { result in
                    switch result {
                    case .failure(let error):
                        print("Error selecting file: \(error.localizedDescription)")
                    case .success(let urls):
                        for url in urls {
                            fileUrlStrings.append(url)
                        }
                    }
                }.frame(width: 352, height: 110, alignment: .center)
                    .background(Color(red: 0.11, green: 0.11, blue: 0.118))
                    .cornerRadius(12)
                    .padding(.bottom)
                
                LazyVGrid(columns: columns) {
                    ForEach(fileUrlStrings, id:\.self){ fileUrlString in
                        Button(action: {
                            selectedUrl = fileUrlString
                            isShowingPDFView.toggle()
                        }, label: {
                            VStack{
                                Image(fileImage(extensionFile: fileUrlString.pathExtension))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                Text(fileUrlString.lastPathComponent)
                                    .padding(6)
                                    .background(colorBg)
                                    .cornerRadius(5)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        })
                        .padding()
                        .cornerRadius(12)
                        .overlay(
                            Button(action: {
                                withAnimation {
                                    if let deletedFile = fileUrlStrings.firstIndex(of: fileUrlString) {
                                        fileUrlStrings.remove(at: deletedFile)
                                    }
                                }
                            }, label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.red)
                                    .padding(4)
                            }), alignment: .topTrailing
                        )
                        .padding(.vertical, 8)
                    }
                }.padding(.horizontal)
                
                Button(action: {
                    firebaseManager.uploadFilesToStorage(fileUrlStrings: fileUrlStrings)
                }) {
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
        .sheet(isPresented: $isShowingPDFView) {
            if let selectedUrl = selectedUrl {
                PDFKitRepresentedView(convertPDFToData(url: selectedUrl), singlePage: true)
            }
        }
        
    }
    
    
    func fileImage(extensionFile: String) -> String {
        switch extensionFile {
        case "pdf":
            return "pdf"
        case "txt":
            return "txt"
        case "doc":
            return "word"
        default:
            return "DATA"
        }
    }
    
    @State var columns = [
        GridItem.init(.flexible()),
        GridItem.init(.flexible()),
        GridItem.init(.flexible()),
    ]
    
    func convertPDFToData(url: URL) -> Data {
        do {
            return try Data(contentsOf: url)
        } catch {
         return Data()
        }
    }
    
}

struct importFile_Previews: PreviewProvider {
    static var previews: some View {
        importFile()
            .environmentObject(FireBaseManager())
            .preferredColorScheme(.dark)
    }
}



import PDFKit
import SwiftUI

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = PDFView

    let data: Data
    let singlePage: Bool

    init(_ data: Data, singlePage: Bool = false) {
        self.data = data
        self.singlePage = singlePage
    }

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        if singlePage {
            pdfView.displayMode = .singlePageContinuous
        }
        return pdfView
    }

    func updateUIView(_ pdfView: UIViewType, context _: UIViewRepresentableContext<PDFKitRepresentedView>) {
        pdfView.document = PDFDocument(data: data)
    }
}
