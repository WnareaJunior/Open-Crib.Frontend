//
//  WelcomeView.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/16/21.
//

import SwiftUI
import Firebase
import CoreData

struct SignUpView: View {
  
    @EnvironmentObject var appState: AppState
    var localAuth: LocalAuth = LocalAuth()
    @State private var emailInput: String  = ""
    @State private var usernameInput: String  = ""
    @State private var passwordInput: String  = ""
    @State private var secondPasswordInput: String  = ""
//    @State private var passwordAlert: String = " "
    @State var birthdate = Date()
    
    var body: some View{
        //Color("cribGray")
        
        
            ZStack{
                Color("cribGray")
                    .ignoresSafeArea()
                VStack{
                    HStack{
                    Text("Find Out ")
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .font(Font.custom("MADETOMMY-Bold", size: 20))
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 30)
                    Text("What's The Play")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .font(Font.custom("MADETOMMY-Bold", size: 25))
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom, 15)
                    }
                    
                    TextField("  Email",text: $emailInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
                    
                    TextField("  Username",text: $usernameInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
                    
                    TextField("  Password",text: $passwordInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .padding(.bottom, 30)
//                    Text("\(passwordAlert)")
//                        .font(Font.system(size: 10,  design: .default))
//                        .foregroundColor(Color("cribCyan"))
                    TextField("  Confirm Password",text: $secondPasswordInput)
                        .frame(width: 240, height: 35)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .font(Font.custom("MADETOMMY-Bold", size: 15))
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .padding(.bottom, 15)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                        .frame(width: 240, height: 35)
                        .foregroundColor(Color.white)
                        .padding()
                        .font(Font.custom("MADETOMMY-Bold", size: 20))
                    
                    Button(action: {
                        //NEEDS TO BE REFACTORED
                        print("On button pressed")
                        localAuth.register(email: emailInput, password: passwordInput)
                        
//                        lazy var persistentContainer: NSPersistentContainer = {
//                            let container = NSPersistentContainer(name: "CurrentUser")
//                            container.loadPersistentStores(completionHandler: { (_, error) in
//                                if let error = error {
//                                    fatalError("Failed to load Core Data stack: \(error)")
//                                }
//                            })
//                            return container
//                        }()
//
//                        lazy var managedObjectContext: NSManagedObjectContext = {
//                            return persistentContainer.viewContext
//                        }()
//                        let context = persistentContainer.viewContext
//
//                        if let entity = NSEntityDescription.entity(forEntityName: "EntityName", in: context) {
//                            let newObject = NSManagedObject(entity: entity, insertInto: context)
//                            newObject.setValue("Example", forKey: "attributeName")
//
//                            do {
//                                try context.save()
//                                print("Object saved successfully")
//                            } catch {
//                                print("Error saving object: \(error)")
//                            }
//                        } else {
//                            print("Entity not found")
//                        }
                       
                        Auth.auth().addStateDidChangeListener{ auth, user in
                            if user != nil {
                                appState.hasOnboarded = true
                            }else {
                                appState.hasOnboarded = false
                            }

                        }
                         
                        
                        }, label: {
                    Text("Sign Up")
                            .frame(width: 240, height: 50)
                            .foregroundColor(.black)
                            .background(Color("cribCyan"))
                            .cornerRadius(20)
                            .font(Font.custom("MADETOMMY-Bold", size: 20))
                    })
                        .onAppear{
                            
                        }
                        
        
//                    NavigationLink(destination: HomePageView(), label: {Text("Sign up")
//                            .frame(width: 240, height: 50)
//                            .foregroundColor(.black)
//                            .background(Color("cribCyan"))
//                            .cornerRadius(10)
//                    })
                    
       
                        
//                    NavigationLink(destination: HomePageView(), label: {Text("Sign up")
//                            .frame(width: 240, height: 50)
//                            .foregroundColor(.black)
//                            .background(Color("cribCyan"))
//                            .cornerRadius(10)
//                    })
                }
            }
            
           
           
            
            
        
        
        
    }
   

        
       
             
                
            
            
        
        

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
            
                
        }
    }
}
}
