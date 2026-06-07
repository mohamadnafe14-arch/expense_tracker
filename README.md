# 💰 Expense Tracker

> **A powerful, feature-rich Flutter mobile application for intelligent expense and income tracking with real-time analytics, custom categories, and seamless Firebase integration.**

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Flutter](https://img.shields.io/badge/flutter-3.12%2B-green)
![Firebase](https://img.shields.io/badge/firebase-integrated-orange)
![Architecture](https://img.shields.io/badge/architecture-clean%20architecture-purple)

---

## 📸 Screenshots

| Home Dashboard                                                          | Add Expense                                                            | Category Chart                                             |
| ----------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------- |
| ![Home](screenshots/WhatsApp%20Image%202026-06-07%20at%2019.31.01.jpeg) | ![Add](screenshots/WhatsApp%20Image%202026-06-07%20at%2019.31.02.jpeg) | ![Chart](screenshots/Screenshot%202026-06-07%20193134.png) |
| View balance & transactions                                             | Create custom categories                                               | Visualize spending patterns                                |

| Category Selection                                                          | Expense List                                                            | Analytics                                                                |
| --------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| ![Category](screenshots/WhatsApp%20Image%202026-06-07%20at%2019.31.03.jpeg) | ![List](screenshots/WhatsApp%20Image%202026-06-07%20at%2019.31.04.jpeg) | ![Stats](screenshots/WhatsApp%20Image%202026-06-07%20at%2019.31.05.jpeg) |
| Filter by categories                                                        | Transaction history                                                     | Detailed breakdown                                                       |

---

## ✨ Key Features

### 🏠 Home Dashboard

- **Balance Overview**: Total balance card with income and expense summary
- **Real-time Updates**: Stream-based live data synchronization
- **Category Filtering**: Quickly filter transactions by custom categories
- **Visual Hierarchy**: Beautiful gradient cards with custom icons and colors
- **Transaction List**: Organized list of all expenses with details

### ➕ Add Expense Management

- **Quick Input**: Simple interface for adding income/expenses
- **Custom Categories**: Create and manage personalized category types
- **Icon & Color Selection**: Choose unique icons and colors for each category
- **Date Picker**: Easy date selection for transactions
- **Instant Sync**: Real-time storage to Firebase Firestore

### 📊 Analytics & Statistics

- **Interactive Charts**: Bar charts powered by `fl_chart` library
- **Category Breakdown**: Visualize spending distribution across categories
- **Dynamic Data**: Charts update automatically with new transactions
- **Group Analysis**: Group expenses by category type for insights

### 🎨 Customization

- **Custom Icons**: Access to Material, Cupertino, and FontAwesome icons
- **Color Picker**: Select from unlimited color options for categories
- **Flexible Categories**: No predefined categories - create what you need
- **Modern UI**: Gradient backgrounds and smooth animations

### 🔥 Firebase Integration

- **Cloud Storage**: All data securely stored in Firestore
- **Real-time Sync**: Automatic updates across all devices
- **Project**: `expense-tracker-864ef`
- **Collection**: Firestore `expenses` collection with structured data

### ⚡ Performance & Reliability

- **Real-time Streams**: Live updates without polling
- **Error Handling**: Comprehensive error messages and recovery
- **State Management**: Efficient BLoC/Cubit pattern
- **Offline Support**: Local state caching before sync

---

## 🏗️ Architecture Overview

This project follows **Clean Architecture** with **BLoC Pattern**:

```
┌─────────────────────────────────────────────────────┐
│           PRESENTATION LAYER                        │
│  (Views, Cubits, Widgets, Dialogs)                 │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│           DOMAIN LAYER                              │
│  (Entities, Use Cases, Repository Interfaces)      │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│           DATA LAYER                                │
│  (Models, Repositories, Firestore Services)        │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│           CORE LAYER                                │
│  (Constants, Utils, Exceptions, Services)          │
└─────────────────────────────────────────────────────┘
```

### 📁 Directory Structure

```
lib/
├── main.dart                              # App initialization & DI setup
├── firebase_options.dart                  # Firebase configuration (multi-platform)
│
├── core/
│   ├── constants/                         # App-wide constants
│   ├── errors/
│   │   ├── failures.dart                 # Error handling classes
│   │   └── exceptions.dart               # Custom exceptions
│   ├── exceptions/
│   │   └── firestore_exception.dart      # Firestore-specific exceptions
│   ├── functions/
│   │   ├── add_category_dialog.dart      # Category creation dialog
│   │   ├── show_error_toast.dart         # Error notifications
│   │   └── convert_date_to_string.dart   # Date formatting utilities
│   ├── services/
│   │   └── firestore_service.dart        # Firestore CRUD operations
│   ├── utils/
│   │   ├── dependecy_injection.dart      # Service locator setup (GetIt)
│   │   └── app_bloc_observer.dart        # BLoC event logging
│   └── widgets/                           # Shared reusable widgets
│
└── features/
    │
    ├── home/                              # Home feature module
    │   ├── presentation/
    │   │   ├── viewmodel/
    │   │   │   └── home_cubit/
    │   │   │       ├── home_cubit.dart    # State management (loadHome, changeCategory)
    │   │   │       └── home_state.dart    # States: Initial, Loading, Loaded, Error
    │   │   ├── views/
    │   │   │   ├── home_view.dart         # Main home screen
    │   │   │   └── widgets/
    │   │   │       ├── calculation_widget.dart      # Balance card (income/expense/total)
    │   │   │       ├── tranactions_chart.dart       # Bar chart visualization
    │   │   │       ├── tranaction_card.dart         # Individual transaction card
    │   │   │       ├── category_list.dart           # Category filter buttons
    │   │   │       └── empty_state_widget.dart      # Empty state UI
    │   ├── data/
    │   │   ├── models/
    │   │   │   ├── calculate_model.dart   # (income, outcome, balance) calculations
    │   │   │   └── group_data_model.dart  # Chart data aggregation
    │   │   └── repositories/
    │   │       └── home_repository.dart   # Home-related data operations
    │   └── domain/
    │       └── entities/                  # Domain models
    │
    ├── add_expense/                       # Add expense feature module
    │   ├── presentation/
    │   │   ├── viewmodel/
    │   │   │   └── add_expense_cubit/
    │   │   │       ├── add_expense_cubit.dart       # Add expense logic
    │   │   │       └── add_expense_state.dart       # States: Initial, Loading, Success, Failure
    │   │   └── views/
    │   │       ├── add_expense_view.dart            # Expense form screen
    │   │       └── widgets/
    │   │           ├── amount_input_field.dart      # Amount input widget
    │   │           ├── category_selector.dart       # Category selection widget
    │   │           └── date_picker_field.dart       # Date selection widget
    │   ├── data/
    │   │   ├── models/
    │   │   │   ├── expense_model.dart    # Expense data structure
    │   │   │   ├── category_model.dart   # Category data structure
    │   │   │   │   └── Fields: name, icon, color, iconFontFamily
    │   │   │   └── group_model.dart      # Grouped expense data
    │   │   └── repositories/
    │   │       └── add_expense_repository.dart
    │   └── domain/
    │       └── entities/
    │
    └── profile/                           # User profile feature module
        ├── presentation/
        ├── data/
        └── domain/
```

---

## 🔄 State Management Flow

### **HomeCubit - Home State Machine**

```dart
States:
  ├── HomeInitial              // Initial state
  ├── HomeLoading              // Fetching data from Firestore
  ├── HomeLoaded               // Data ready
  │   ├── categories          // List of categories
  │   ├── expenses             // Filtered expenses
  │   ├── calculations         // { income, outcome, balance }
  │   ├── groupData            // Chart data { category: amount }
  │   └── selectedCategory     // Currently selected filter
  └── HomeError                // Error occurred

Events/Methods:
  • loadHome()                 // Stream listener on expenses collection
  • changeCategory(category)   // Update selected category filter
```

### **AddExpenseCubit - Expense Addition State Machine**

```dart
States:
  ├── AddExpenseInitial        // Initial state
  ├── AddExpenseLoading        // Sending to Firestore
  ├── AddExpenseSuccess        // Successfully added
  └── AddExpenseFailure        // Error adding expense

Events/Methods:
  • addExpense(expenseModel)   // Save to Firestore
```

### **Event Flow Example**

```
User clicks FAB
    ↓
AddExpenseView opened
    ↓
User fills form (amount, category, date)
    ↓
User taps Save button
    ↓
AddExpenseCubit.addExpense() called
    ↓
emit(AddExpenseLoading)
    ↓
FirestoreService.addExpense() → Firestore
    ↓
emit(AddExpenseSuccess)
    ↓
Navigate back to Home
    ↓
HomeCubit Stream updates (Real-time)
    ↓
UI refreshes with new data
```

---

## 🔥 Firebase Integration

### **Firebase Project**

- **Project ID**: `expense-tracker-864ef`
- **Database**: Cloud Firestore
- **Authentication**: Firebase Auth (configured)

### **Firestore Collections**

#### **`expenses` Collection**

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "amount": 125.5,
  "date": "2026-06-07",
  "transactionType": "Deposit",
  "categories": [
    {
      "name": "Groceries",
      "icon": 57622, // Material Icon code
      "color": 4294198016, // ARGB Color integer
      "iconFontFamily": "MaterialIcons"
    }
  ]
}
```

### **FirestoreService Methods**

```dart
// Add new expense
Future<ExpenseModel> addExpense(ExpenseModel expense)

// Get real-time stream of expenses
Future<Stream<QuerySnapshot>> getExpenses()

// Query specific expenses
Future<List<ExpenseModel>> getExpensesByCategory(String category)

// Update existing expense
Future<void> updateExpense(ExpenseModel expense)

// Delete expense
Future<void> deleteExpense(String expenseId)
```

### **Error Handling**

```dart
FireStoreException
├── PermissionDeniedException      // User lacks permissions
├── UnAuthenticatedException       // Not logged in
├── UnavailableServiceException    // Service offline
├── NotFoundException              // Document not found
└── InvalidArgumentException       // Invalid query/data

Wrapped in:
├── GenericFailure
└── FirebaseFailure
```

---

## 📦 Technology Stack

### **Framework & Language**

- **Flutter**: 3.12+ (Dart 3.12.0+)
- **Dart**: Modern null-safety

### **State Management**

- **flutter_bloc**: ^9.1.1 - BLoC pattern
- **bloc**: ^9.2.1 - Core BLoC library
- **Cubit**: Simplified BLoC variant

### **Backend & Data**

- **firebase_core**: ^4.9.0 - Firebase initialization
- **cloud_firestore**: ^6.5.0 - NoSQL database
- **uuid**: ^4.5.3 - Unique ID generation

### **Functional Programming**

- **fpdart**: ^1.2.0 - Either pattern for error handling
  - `Right<Success>` for success
  - `Left<Failure>` for errors

### **Dependency Injection**

- **get_it**: ^9.2.1 - Service locator pattern

### **UI & Visualization**

- **fl_chart**: ^1.2.0 - Interactive charts (BarChart)
- **flutter_colorpicker**: ^1.1.0 - Color selection
- **flutter_iconpicker**: ^4.0.3 - Icon selection
- **flutter_spinkit**: ^5.2.2 - Loading animations
- **another_flushbar**: ^2.2.4 - Error/success notifications
- **top_snackbar_flutter**: ^3.3.0 - Top snack bars

### **Utilities**

- **intl**: ^0.20.2 - Date/time formatting
- **cupertino_icons**: ^1.0.8 - iOS icons

---

## 🎨 Design System

### **Color Palette**

```dart
Primary (Bright Blue):    #00B2E7  - Main actions
Secondary (Purple):       #E064F7  - Accent elements
Tertiary (Coral):         #FF8D6C  - Highlights
Surface (Light Gray):     #F5F5F5  - Background
Error (Red):              #FF6B6B  - Errors/warnings
```

### **Typography**

- **Headlines**: Bold, large sizes
- **Body**: Regular weight, readable
- **Captions**: Smaller, secondary information

### **Components**

- **Gradient Cards**: Main content containers
- **Floating Action Button**: Custom gradient FAB for actions
- **Chips**: Category selection badges
- **Custom Icons**: Material + Cupertino + FontAwesome

---

## 🚀 Getting Started

### **Prerequisites**

```bash
# System requirements
- Flutter SDK: 3.12.0 or higher
- Dart SDK: 3.12.0 or higher
- Android SDK: minSdkVersion 21 (or higher)
- iOS: iOS 12.0 or higher

# Tools
- Android Studio or VS Code with Flutter extension
- Xcode (for iOS development)
- Firebase account (https://firebase.google.com)
```

### **Installation Steps**

#### 1. **Clone the Repository**

```bash
git clone https://github.com/yourusername/expense_tracker.git
cd expense_tracker
```

#### 2. **Install Dependencies**

```bash
flutter pub get
```

#### 3. **Configure Firebase**

**Android Setup:**

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project or select existing: `expense-tracker-864ef`
3. Download `google-services.json`
4. Place in: `android/app/google-services.json`

**iOS Setup:**

1. Download `GoogleService-Info.plist`
2. Open iOS project: `ios/Runner.xcworkspace` (NOT .xcodeproj)
3. Add the file to Runner project

#### 4. **Run the Application**

```bash
# Development mode
flutter run

# Specific device
flutter run -d <device-id>

# Profile mode (performance testing)
flutter run --profile

# Release mode
flutter run --release
```

#### 5. **Build for Distribution**

**Android APK:**

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

**Android App Bundle:**

```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

**iOS:**

```bash
flutter build ios --release
# Then use Xcode to upload to App Store
```

---

## 📚 Project Features in Detail

### **Real-time Transaction Tracking**

- Expenses and income updated instantly
- No manual refresh needed
- Offline queue for later sync (future enhancement)

### **Smart Category System**

- Create unlimited categories
- Assign custom icons from Material/Cupertino icons
- Pick any color from color wheel
- Quick category switching for filtering

### **Visual Analytics**

- Bar charts showing spending by category
- Automatic data aggregation
- Touch interactions on chart points
- Category-wise breakdown

### **Data Aggregation**

- **Total Income**: Sum of all "Deposit" transactions
- **Total Expense**: Sum of all expense transactions
- **Balance**: Income - Expense
- **Category Distribution**: Grouped by category type

---

## 🧪 Testing

### **Manual Testing Checklist**

- [ ] Add new expense
- [ ] Create custom category
- [ ] Select category color and icon
- [ ] Filter by category
- [ ] View updated balance
- [ ] Check chart data
- [ ] Test error scenarios
- [ ] Verify Firestore sync

### **Running Tests** (if available)

```bash
flutter test
```

---

## 🐛 Troubleshooting

### **Common Issues**

| Issue                       | Solution                                              |
| --------------------------- | ----------------------------------------------------- |
| Firebase connection failed  | Verify `google-services.json` and internet connection |
| Build errors                | Run `flutter clean && flutter pub get`                |
| UI not updating             | Check BLoC observer logs in console                   |
| Icons not showing           | Ensure `flutter_iconpicker` is properly installed     |
| Firestore permission denied | Check Firebase rules and authentication               |

### **Debug Logs**

- BLoC events: Enabled via `AppBlocObserver`
- Firestore: Check Firebase Console
- App logs: `flutter logs`

---

## 🔐 Security Notes

### **Firebase Security Rules** (Recommended)

```firestore
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /expenses/{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### **Best Practices**

- ✅ Never commit Firebase credentials
- ✅ Use environment variables for sensitive data
- ✅ Validate input on client and server
- ✅ Implement user authentication
- ✅ Enable Firestore backup

---

## 📈 Performance Optimization

- **Lazy Loading**: Categories loaded on demand
- **Stream-based Updates**: Efficient real-time sync
- **Proper State Management**: Prevents unnecessary rebuilds
- **Responsive Images**: Optimized for different screen sizes

---

## 🎓 Learning Resources

### **Flutter & Dart**

- [Flutter Official Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

### **BLoC Pattern**

- [BLoC Library](https://bloclibrary.dev/)
- [Flutter BLoC Tutorial](https://bloclibrary.dev/#/fluttertodostutorial)

### **Firebase**

- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Firestore Documentation](https://firebase.google.com/docs/firestore)

### **Clean Architecture**

- [Clean Architecture Guide](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture](https://resocoder.com/flutter-clean-architecture)

---

## 📝 Code Examples

### **Adding an Expense**

```dart
// From UI
context.read<AddExpenseCubit>().addExpense(
  ExpenseModel(
    id: const Uuid().v4(),
    amount: 125.50,
    date: DateTime.now(),
    transactionType: 'Expense',
    categories: [
      CategoryModel(
        name: 'Groceries',
        icon: Icons.shopping_cart.codePoint,
        color: Colors.green.value,
        iconFontFamily: 'MaterialIcons',
      ),
    ],
  ),
);
```

### **Listening to Home State Changes**

```dart
BlocListener<HomeCubit, HomeState>(
  listener: (context, state) {
    if (state is HomeError) {
      showErrorToast(context, state.failure.message);
    }
  },
  child: BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      if (state is HomeLoaded) {
        return ListView(
          children: state.expenses.map((e) => ExpenseCard(e)).toList(),
        );
      }
      return Center(child: CircularProgressIndicator());
    },
  ),
);
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** changes: `git commit -m 'Add amazing feature'`
4. **Push** to branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

### **Code Style**

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

---

## 📄 License

This project is **private** and for personal use only. All rights reserved.

---

## 👨‍💻 Author & Support

**Project**: Expense Tracker  
**Version**: 1.0.0+1  
**Status**: Active Development

### **Contact & Support**

- 🐛 **Bug Reports**: Open an issue in the repository
- 💬 **Questions**: Create a discussion thread
- 📧 **Email**: [your-email@example.com]
- 🔗 **Portfolio**: [your-portfolio-link]

---

## 🙏 Acknowledgments

- **Flutter & Dart Teams** - Amazing framework
- **Firebase** - Reliable backend
- **BLoC Library** - State management pattern
- **Open Source Community** - Great packages and tools

---

<div align="center">

### **Happy Expense Tracking! 💳✨**

_Made with ❤️ using Flutter_

[⬆️ Back to Top](#-expense-tracker)

</div>
