# InstaClone – SwiftUI + Firebase

Instagram-style iOS app built with **SwiftUI** and **Firebase**, focusing on clean architecture, modern async patterns, and production-style social features.

This project is designed to show how I structure and ship a real-world iOS app using SwiftUI, MVVM, and Firebase (Auth, Firestore, Storage).

---

## 🚀 Highlights

- Modern **SwiftUI + async/await**
- **MVVM** with a dedicated service layer (no Massive Views)
- **AuthManager** as an @EnvironmentObject
- Full **Firebase** integration:
  - Authentication (Email/Password)
  - Firestore (users, posts, likes, comments, followers/following)
  - Storage (image uploads)
- Real social app features: feed, profile, posts, likes, comments, follow system, timestamps

---

## ✨ Features

- Email/password sign up & login (Firebase Auth)
- Create posts via `PhotosPicker` with JPEG compression and upload to Firebase Storage
- Feed screen + profile grid
- Like / Unlike posts with live like counts
- Edit profile (avatar, name, bio)
- **Per-post comments** stored in a `post-comments` Firestore subcollection
- **Follow / Unfollow** with state-driven UI updates (Follow ↔ Following)
- **Followers / Following lists** with navigation from profile stats
- **Human-readable timestamps** for posts and comments  
  (e.g. `2m`, `3h`, `1d` via a reusable `Timestamp` extension)
- Basic error handling & simple empty states

Planned / next steps: search improvements, saved posts, stories, push notifications, pagination, and stronger error handling.

---

## 🧱 Tech & Architecture

- **Language:** Swift  
- **UI:** SwiftUI  
- **Architecture:** MVVM + service layer  
- **Async:** async/await  
- **State:** `ObservableObject`, `@Published`, `@EnvironmentObject`  
- **Backend:** Firebase (Auth, Firestore, Storage)

**Core pieces:**

- `AuthManager` (`@EnvironmentObject`)  
  - Manages `userSession` (uid) and `currentUser`
  - Exposed to the view hierarchy for navigation and auth state

- Services (Firebase-facing)
  - `AuthService` – login, register, session
  - `UserService` – user profiles + follow system + stats (followers/following/posts)
  - `PostService` – create/fetch posts, likes
  - `CommentsService` – upload & fetch comments per post

- ViewModels
  - One view model per feature/screen
  - Owns `@Published` state and user intents  
    (e.g. `likePost()`, `uploadComment()`, `follow()`, `unfollow()`, `loadComments()`)

---

## ⚙️ Running the App

1. Clone the repo and open in **Xcode 15+** (iOS 17+ recommended).
2. Create a **Firebase** project:
   - Enable Authentication (Email/Password)
   - Enable Firestore
   - Enable Storage
3. Download `GoogleService-Info.plist` and add it to the app target.
4. Update the bundle identifier if needed.
5. Build & run on a simulator or device.


If you’re reviewing this as part of a hiring process and would like to discuss the code or architecture decisions, I’m happy to walk through the project.

🖼️ Screenshots
<img width="1470" height="956" alt="Screenshot 2025-11-04 at 00 26 03" src="https://github.com/user-attachments/assets/f43d92e4-2d75-45b4-b5e2-c30d58f2c7e8" />
<img width="1470" height="956" alt="Screenshot 2025-11-03 at 23 47 41" src="https://github.com/user-attachments/assets/a68137c8-780e-4236-b083-c6f85f71db9c" />
<img width="1470" height="956" alt="Screenshot 2025-11-03 at 23 48 45" src="https://github.com/user-attachments/assets/8e070eec-a2ec-429b-a332-373849910a35" />
<img width="1470" height="956" alt="Screenshot 2025-11-03 at 23 49 20" src="https://github.com/user-attachments/assets/23740163-6cd7-454b-b20c-fc63a0799b35" />
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



