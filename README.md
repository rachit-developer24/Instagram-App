InstaClone – SwiftUI + Firebase
Instagram-style iOS app built with SwiftUI and Firebase, focused on clean architecture, modern concurrency, and real-world social features.
This project demonstrates how I structure and ship a production-style iOS app using SwiftUI, MVVM, and a dedicated service layer with dependency injection.

🚀 Highlights
• Modern SwiftUI with async/await
• MVVM + service layer (no Massive Views, no singletons)
• AuthManager injected via @EnvironmentObject
• Core authentication logic unit tested with XCTest using mocked services
• Full Firebase integration
• Real social features: feed, posts, likes, comments, follow/unfollow, notifications, timestamps

✨ Features
• Email/password sign up & login (Firebase Auth)
• Create posts via PhotosPicker with JPEG compression
• Feed screen and profile grid
• Like / Unlike posts with live count updates
• Edit profile (avatar, name, bio)
• Per-post comments stored in Firestore subcollections
• Follow / Unfollow with state-driven UI updates
• Followers / Following lists with profile navigation
• Human-readable timestamps (2m, 3h, 1d) via reusable extensions
• Notifications feed (Like / Comment / Follow)
• Stored per user in Firestore
• Hydrated with sender user and optional related post
• User-friendly authentication errors mapped from FirebaseAuth codes

🧱 Tech & Architecture
• Language: Swift
• UI: SwiftUI
• Architecture: MVVM + service layer
• Async: async/await
• State: ObservableObject, @Published, @EnvironmentObject
• Backend: Firebase (Auth, Firestore, Storage)
Core Components
AuthManager (@EnvironmentObject)
• Manages authentication state (userSession, currentUser)
• Drives app navigation based on auth lifecycle
• Unit tested with mocked AuthService
Services (Firebase-facing)
• AuthService – login, register, session management
• UserService – user profiles, follow system, stats
• PostService – create/fetch posts, likes
• CommentsService – upload & fetch comments per post
• NotificationService – per-user notification inbox (like/comment/follow)
ViewModels
• One ViewModel per screen/feature
• Owns @Published state and user intents
• likePost()
• follow() / unfollow()
• uploadComment()
• fetchNotifications()

🔔 Notifications (How It Works)
• Notifications are written to the receiver’s Firestore inbox
• Path: notifications/{receiverUid}/user-notifications/{notificationId}
• Types: like, comment, follow
Payload includes:
• Sender UID
• Type
• Timestamp
• Optional post ID
On fetch, notifications are hydrated with:
• Sender User (avatar + username)
• Related Post (preview image), when applicable

🧪 Testing
• Unit tests for AuthManager
• Dependency injection with mocked services
• Covers login, registration, validation, password reset, logout, and account deletion
• Async/await–based XCTest

⚙️ Running the App
• Clone the repository and open in Xcode 15+ (iOS 17 recommended)
• Create a Firebase project
• Enable Authentication (Email/Password)
• Enable Firestore
• Enable Storage
• Add GoogleService-Info.plist to the app target
• Update the bundle identifier if required
• Build and run on simulator or device

If you’re reviewing this project as part of a hiring process and would like to discuss the architecture or implementation decisions, I’m happy to walk through the code.

🖼️ Screenshots
<img width="980" height="810" alt="Screenshot 2025-12-29 at 01 29 09" src="https://github.com/user-attachments/assets/88f4e441-be60-4fc8-9076-74b89be5c7d7" />
<img width="831" height="871" alt="Screenshot 2025-12-29 at 02 00 27" src="https://github.com/user-attachments/assets/b4e81240-8ec4-4443-b862-9768e3dc5239" />
<img width="1037" height="870" alt="Screenshot 2025-12-29 at 01 52 49" src="https://github.com/user-attachments/assets/e3d4c6e5-8f2f-41f0-973c-296dde5c3064" />
<img width="1067" height="894" alt="Screenshot 2025-12-29 at 01 46 56" src="https://github.com/user-attachments/assets/8abcd707-bf05-4d59-a1f3-9bcb374344d5" />
<img width="1004" height="903" alt="Screenshot 2025-12-29 at 01 47 51" src="https://github.com/user-attachments/assets/70e96cad-7e46-4128-b12f-699dcaef011f" />
<img width="981" height="880" alt="Screenshot 2025-12-29 at 01 55 18" src="https://github.com/user-attachments/assets/66a22f7e-d0b8-4b4d-874f-9f8e0f60dc0f" />
<img width="937" height="873" alt="Screenshot 2025-12-29 at 01 57 10" src="https://github.com/user-attachments/assets/e19d8161-4123-4658-a470-c18a51a41acb" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 14 27" src="https://github.com/user-attachments/assets/de98d2f1-1be3-43a6-a4f2-f18a31722f61" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 34 36" src="https://github.com/user-attachments/assets/a20b29f3-ab51-49c2-8f37-d2bd4e50ff89" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 31 35" src="https://github.com/user-attachments/assets/d6b0761d-0901-4518-ada7-77d06fb09f23" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 20 19" src="https://github.com/user-attachments/assets/3dda6269-3eb0-45e4-b4cf-a7ef6e974bf3" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 24 22" src="https://github.com/user-attachments/assets/65b54ed7-e5bd-42a7-8140-bec3d6823b7a" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 29 53" src="https://github.com/user-attachments/assets/eba7b14f-7bf1-4d1f-885f-40a49dcadc6c" />
<img width="1205" height="894" alt="Screenshot 2025-11-14 at 01 01 44" src="https://github.com/user-attachments/assets/4161f0dd-a499-425d-90be-388056eb204c" />
<img width="1470" height="956" alt="Screenshot 2025-12-10 at 01 16 47" src="https://github.com/user-attachments/assets/bdf837ad-699f-4a38-9e1d-ec08ca5c7027" />
<img width="1470" height="956" alt="Screenshot 2025-12-10 at 01 16 53" src="https://github.com/user-attachments/assets/456d2b64-c0f3-4b1c-9930-f7647e6b242f" />
<img width="1470" height="956" alt="Screenshot 2025-12-10 at 01 17 00" src="https://github.com/user-attachments/assets/bf727669-9e7b-4c33-9998-49f073696bef" />
<img width="1470" height="956" alt="Screenshot 2025-12-10 at 01 17 14" src="https://github.com/user-attachments/assets/736ba566-eb18-4b81-a92e-e2eb43a306c8" />
<img width="1191" height="954" alt="Screenshot 2025-12-19 at 03 14 10" src="https://github.com/user-attachments/assets/569a6922-e871-429d-8592-124d54b2555b" />
<img width="1109" height="919" alt="Screenshot 2025-12-19 at 02 35 15" src="https://github.com/user-attachments/assets/c619e881-372a-470e-8021-a9a3fc445a26" />




