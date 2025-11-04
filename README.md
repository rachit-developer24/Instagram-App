InstaClone — SwiftUI + Firebase
A practical Instagram-style iOS app rebuilt end-to-end to demonstrate real-world SwiftUI + Firebase skills: clean MVVM, async/await, image upload, and a production-like feature set. 

✨ Features
Email/password auth (Firebase Auth)
Create posts via PhotosPicker (JPEG compression)
Feed + profile grid + post detail
Like/Unlike with live counts
Edit profile (avatar, name, bio)
Human-readable timestamps
Robust error handling & empty states

In progress / next: Comments, follow/unfollow, search, push notifications, saved posts, stories.
🧱 Tech Stack
Swift, SwiftUI, MVVM, Combine, async/await
Firebase: Authentication, Firestore, Storage
Codable/Hashable models, ObservableObject view models
🧭 Architecture (high level)
Services: AuthService, UserService, PostService
ViewModels: Small, focused @Published state + intents
Views: Stateless SwiftUI where possible; navigation by feature

🗂️ Project Structure
InstaClone/
  ├─ Models/         // User, Post, etc.
  ├─ Services/       // AuthService, UserService, PostService
  ├─ ViewModels/     // FeedVM, ProfileVM, PostComposerVM
  ├─ Views/          // FeedView, ProfileView, PostComposerView
  └─ Utilities/      // ImageUploader, DateFormatters
🧩 Key Models (excerpt)

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageurl: String
    let timestamp: Date
    var user: User?
}

📤 Image Upload Flow
Pick image with PhotosPicker → compress to JPEG
ImageUploader.uploadImage(image:) → uploads to Firebase Storage
Get public URL → save Post document in Firestore
Feed/profile query and render via SwiftUI
⚙️ Setup
Clone repo → open in Xcode 15+ (iOS 17+ target recommended)
Create a Firebase project; enable Auth (Email/Password), Firestore, Storage
Add GoogleService-Info.plist to the app target
Update bundle identifiers if needed → Build & Run

🔐 Firestore Rules (starter idea)
rules_version = '2';
service cloud.firestore {
  match /databases/{db}/documents {
    match /users/{uid} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && request.auth.uid == uid;
    }
    match /posts/{postId} {
      allow read: if true;
      allow create: if request.auth != null
        && request.resource.data.ownerUid == request.auth.uid;
      allow update, delete: if request.auth != null
        && resource.data.ownerUid == request.auth.uid;
    }
  }
}

🖼️ Screenshots
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 26 03" src="https://github.com/user-attachments/assets/f43d92e4-2d75-45b4-b5e2-c30d58f2c7e8" />
<img width="1470" height="956" alt="Screenshot 2025-11-03 at 23 47 41" src="https://github.com/user-attachments/assets/a68137c8-780e-4236-b083-c6f85f71db9c" />
<img width="1470" height="956" alt="Screenshot 2025-11-03 at 23 48 45" src="https://github.com/user-attachments/assets/8e070eec-a2ec-429b-a332-373849910a35" />
<img width="1470" height="956" alt="Screenshot 2025-11-03 at 23 49 20" src="https://github.com/user-attachments/assets/23740163-6cd7-454b-b20c-fc63a0799b35" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 14 27" src="https://github.com/user-attachments/assets/de98d2f1-1be3-43a6-a4f2-f18a31722f61" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 14 27" src="https://github.com/user-attachments/assets/25e8a461-f0ee-4c90-83c4-1f0565d2a7e7" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 20 19" src="https://github.com/user-attachments/assets/3dda6269-3eb0-45e4-b4cf-a7ef6e974bf3" />
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 24 22" src="https://github.com/user-attachments/assets/65b54ed7-e5bd-42a7-8140-bec3d6823b7a" />



