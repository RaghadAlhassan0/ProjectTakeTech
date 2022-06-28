//
// userProfile.swift
// profilePage
//
// Created by Sara Ahmed Alshammari on 14/11/1443 AH.
//
import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI
import UniformTypeIdentifiers

struct userProfileView: View {
    @State var imageUrl: String = "mohammed"
    @State var name : String = "Mohammed"
    @State var email : String = "Moham@gmail.com"
    @State var password : String = "***********"
    @EnvironmentObject var firebaseManager: FireBaseManager
    @Environment(\.presentationMode) var presentationMode
    @State var profileImage: UIImage?
    @State var isLoading: Bool = false
    @State private var text: String = ""
    @State var showingImagePicker: Bool = false
    @State var isEditingName: Bool = false
    @State var isEditingEmail: Bool = false
    @State var fileUrlStrings: [URL] = []
    @State var selectedUrl: URL?
    @State var isShowingPDFView: Bool = false
    @State var showImporter: Bool = false
    @State var major : String = "1"
    @State var colorBg = Color(#colorLiteral(red: 0.1730993092, green: 0.1771541238, blue: 0.1973441839, alpha: 1))
    @State var colorBg2 = Color(#colorLiteral(red: 0.1715233028, green: 0.1774986684, blue: 0.1971223056, alpha: 1))
    @State var majors: [String] = [ "Information Technology" ,"Computer Science" ,"Information System", "Internet Of Things", "Artificial Intelligence", "Cyber Security", "Data Analysis", "Software Engineering"]
    
    @State var isShowingDeletingDocumentAlert: Bool = false
    
    init(){
        UITabBar.appearance().backgroundColor =  UIColor(.init("gray"))
        UITableView.appearance().backgroundColor = UIColor(named: "background")
        UITableView.appearance().separatorEffect = .none
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().separatorStyle = .none
        UIScrollView.appearance().backgroundColor = UIColor(named: "background")
        
    }
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                Color.init("background")
                    .edgesIgnoringSafeArea(.all)
                if !firebaseManager.currentUser.isAccountActive {
                    Text("Your profile will be processing ...")
                } else {
                    Form {
                        VStack(alignment: .leading){
                            Button {
                                showingImagePicker.toggle()
                            } label: {
                                if let profileImage = profileImage {
                                    Image(uiImage: profileImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                } else {
                                    WebImage(url: URL(string: firebaseManager.currentUser.ImageURL))
                                        .resizable()
                                        .placeholder{ Rectangle().foregroundColor(.gray)}
                                        .indicator(.activity)
                                        .transition(.fade(duration: 0.5))
                                        .scaledToFill()
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .clipShape(Circle())
                                }
                            }.buttonStyle(.borderless)
                                .foregroundColor(.black)
                            
                            Button {
                                
                                firebaseManager.updateProfileImage(userId: firebaseManager.currentUser.id,
                                                                   profileImage: profileImage) { isSuccess in
                                    
                                }
                            } label: {
                                Text("Save image")
                                    .opacity(profileImage != nil ? 1 : 0)
                            }.buttonStyle(.borderless)
                            
                            
                            Group{
                                
                                HStack{
                                    Image(systemName:"person.fill")
                                        .frame(width: 15, height: 25)
                                        .foregroundColor(.gray)
                                    TextField("Name", text: $firebaseManager.currentUser.name, onEditingChanged: { isEditing in
                                        isEditingName = isEditing
                                    })
                                    .padding(.leading, 16.0)
                                    .font(.system(size: 14))
                                    Spacer()
                                    Button {
                                        firebaseManager.updateCurrentName(name: firebaseManager.currentUser.name) { isSuccess in
                                            
                                        }
                                    } label: {
                                        Text("save")
                                            .opacity(isEditingName ? 1 : 0)
                                        
                                    }
                                    .padding(.trailing, 18)
                                }
                                Divider()
                                HStack{
                                    Image(systemName:"envelope.fill")
                                        .frame(width: 15, height: 25)
                                        .foregroundColor(.gray)
                                    TextField("Email", text: $firebaseManager.currentUser.email, onEditingChanged: { isEditing in
                                        isEditingEmail = isEditing
                                    })
                                    .padding(.leading, 16.0)
                                    .foregroundColor(.primary).font(.system(size: 14)).font(.system(size: 17))
                                    Spacer()
                                    Button {
                                        firebaseManager.updateEmail(email: firebaseManager.currentUser.email) { isSuccess in
                                            
                                        }
                                    } label: {
                                        Text("save")
                                            .opacity(isEditingEmail ? 1 : 0)
                                        
                                    }
                                    .padding(.trailing, 18)
                                }
                                Divider()
                                HStack{
                                    Image(systemName:"lock.fill")
                                        .frame(width: 17, height: 25)
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 16.0)
                                    Text(password)
                                        .font(.system(size: 14))
                                }
                                Divider()
                                HStack{
                                    Image(systemName:"heart.fill")
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 2.0)
                                    NavigationLink(destination: EmptyState()) {
                                        Text("My Favorite")
                                        //                    .lineLimit(1)
                                            .font(.system(size: 14))
                                            .foregroundColor(.primary)
                                            .padding()
                                        Spacer()
                                        Image(systemName:"chevron.forward")
                                            .foregroundColor(.white)
                                    }.padding(.horizontal,0)
                                }
                                Divider()
                            }
                        }
                        Spacer()
                        
                        Group{
                            
                            Section {
                                TextField("",text: .constant(""))
                                    .padding()
                                    .background(colorBg2)
                                    .cornerRadius(12)
                            } header: {
                                Text("Years of Experiance*")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 4.0)
                            }.listRowBackground(colorBg2)
                            
                            Section {
                                Picker(selection: $major){
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
                        }
                        
                        
                        Section {
                            TextEditor(text: $text)
                                .frame(width: 358, height: 125, alignment: .leading)
                                .padding()
                                .background(colorBg2)
                                .cornerRadius(12)
                            
                            
                        }header: {
                            Text("Describe yourself*")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 4.0)
                        }.listRowBackground(colorBg2)
                        
                        Text("UPLOAD ANY DOCUMENTS THAT APPROVE YOUR PROVIDED INFORMATION*")
                            .fontWeight(.bold)
                            .font(.system(size:12))
                            .frame(width: 358, height: 38, alignment: .leading)
                            .padding(.leading, 50.0)
                            .padding(.bottom, 8.0)
                        
                        if firebaseManager.currentUser.documents.count != 0 {
                            LazyVGrid(columns: columns) {
                                ForEach(firebaseManager.currentUser.documents, id:\.self){ document in
                                    Button(action: {
                                        if let url = URL(string: document) {
                                            selectedUrl = url
                                            isShowingPDFView.toggle()
                                        }
                                    }, label: {
                                        if let url = URL(string: document) {
                                            VStack{
                                                Image(fileImage(extensionFile: url.pathExtension))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 40, height: 40)
                                                Text(url.lastPathComponent)
                                                    .font(.system(size: 14))
                                                    .padding(6)
                                                    .background(colorBg)
                                                    .cornerRadius(5)
                                                    .fixedSize(horizontal: false, vertical: true)
                                            }
                                        }
                                    }).buttonStyle(.borderless)
                                        .padding()
                                        .cornerRadius(12)
                                        .overlay(
                                            Button(action: {
                                                selectedUrl = URL(string: document)
                                                isShowingDeletingDocumentAlert.toggle()
                                   
                                                
                                                
                                            }, label: {
                                                Image(systemName: "xmark.circle")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(.red)
                                                    .padding(4)
                                            }).buttonStyle(.borderless)
                                            , alignment: .topTrailing
                                        )
                                        .padding(.vertical, 8)
                                }
                            }.padding(.horizontal)
                                .listRowBackground(Color.clear)
                            
                        }
                        
                        
                        Button {
                            showImporter.toggle()
                        } label: {
                            HStack{
                                Spacer()
                                Text("Import Files")
                                Spacer()
                            }
                            .padding()
                            .background(colorBg2.cornerRadius(12))
                            .cornerRadius(12)
                            .padding()
                            .listRowBackground(colorBg2.cornerRadius(12))
                            .cornerRadius(12)
                        }.buttonStyle(.borderless)
                        
                        
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
                            .listRowBackground(Color.clear)
                        
                        Button(action: {
                            withAnimation {
                                firebaseManager.uploadFilesToStorage(fileUrlStrings: fileUrlStrings)
                                fileUrlStrings.removeAll()
                            }
                        }) {
                            HStack{
                                Spacer()
                                Text("Create")
                                    .foregroundColor(.black)
                                    .fontWeight(.medium)
                                    .frame(width: 285, height: 40, alignment: .center)
                                    .background(.foreground)
                                    .foregroundColor(.init("blue"))
                                    .cornerRadius(6)
                                Spacer()
                            }
                        }.listRowBackground(Color.clear)
                            .opacity(fileUrlStrings.count != 0 ? 1 : 0)
                        
                        
                        
                        Button {
                            isLoading.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                firebaseManager.logOut { isSuccess in
                                    if isSuccess {
                                        self.isLoading.toggle()
                                        presentationMode.wrappedValue.dismiss()
                                    } else {
                                        isLoading.toggle()
                                    }
                                }
                            }
                        } label: {
                            HStack{
                                Spacer()
                                Text("Log Out")
                                    .foregroundColor(.red)
                                    .fontWeight(.medium)
                                    .frame(width: 285, height: 40, alignment: .center)
                                Spacer()
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: 6.0).stroke(Color.red))
                        .listRowBackground(Color.clear)
                        
                    }.listStyle(.plain)
                        .listSectionSeparator(.hidden)
                    
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit")
                        .font(.system(size: 17))
                        .foregroundColor(Color("blue"))
                }
            }
        }.overlay(
            ZStack{
                Color.black.ignoresSafeArea()
                    .opacity(0.4)
                VStack(spacing: 30){
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.white)
                        .scaleEffect(2)
                    Text("Logging out\nPlease wait...")
                }.padding(30)
                    .background(Material.ultraThinMaterial)
                    .cornerRadius(12)
            }.opacity(isLoading ? 1 : 0)
        )
        
        .alert(isPresented: $isShowingDeletingDocumentAlert) {
            Alert(title: Text("Deleting \(selectedUrl?.lastPathComponent ?? "")"),
                  message: Text("Are you sure you want to delete \(selectedUrl?.lastPathComponent ?? "")"),
                  primaryButton: .destructive(Text("Delete"), action: {
                if let deletedFile = firebaseManager.currentUser.documents.firstIndex(of: selectedUrl?.absoluteString ?? "") {
                    firebaseManager.currentUser.documents.remove(at: deletedFile)
                    firebaseManager.deleteDocument()
                }
            }), secondaryButton: .cancel(Text("Cancel")) )
        }
        .sheet(isPresented: $isShowingPDFView) {
            if let selectedUrl = selectedUrl {
                PDFKitRepresentedView(convertPDFToData(url: selectedUrl), singlePage: true)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $profileImage)
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
struct userProfile_Previews: PreviewProvider {
    static var previews: some View {
        userProfileView()
            .environmentObject(FireBaseManager())
            .preferredColorScheme(.dark)
    }
}
