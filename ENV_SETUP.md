# Environment Variables Setup

## Creating the `.env` File

You need to manually create a `.env` file in the root of your project (`/Users/ahlamyusuf/qafila_app/`).

### Steps:

1. **Create the file:**
   - In your project root, create a new file called `.env` (note the dot at the beginning)
   - You can do this in VS Code, your terminal, or any text editor

2. **Add the following content:**
   ```
   # API Configuration
   API_BASE_URL=http://localhost:3001/api/v1
   
   # You can add more environment variables here as needed
   # API_KEY=your_api_key_here
   # DEBUG_MODE=true
   ```

3. **Create `.env.example` (optional but recommended):**
   - Create another file called `.env.example`
   - Copy the same content as above
   - This serves as a template for other developers

### Using Terminal (Quick Method)

```bash
cd /Users/ahlamyusuf/qafila_app

# Create .env file
echo '# API Configuration
API_BASE_URL=http://localhost:3001/api/v1

# You can add more environment variables here as needed
# API_KEY=your_api_key_here
# DEBUG_MODE=true' > .env

# Create .env.example file
echo '# API Configuration
API_BASE_URL=http://localhost:3001/api/v1

# Example environment variables
# API_KEY=your_api_key_here
# DEBUG_MODE=true' > .env.example
```

## Configuration

### Changing API URL for Different Environments

**Development (localhost):**
```
API_BASE_URL=http://localhost:3001/api/v1
```

**Production:**
```
API_BASE_URL=https://your-production-domain.com/api/v1
```

**Staging:**
```
API_BASE_URL=https://staging.your-domain.com/api/v1
```

## Important Notes

### Security

⚠️ **NEVER commit your `.env` file to version control!**

The `.env` file should already be in your `.gitignore`. If not, add it:

```bash
echo '.env' >> .gitignore
```

### Multiple Environments

You can create different env files for different environments:

- `.env.development` - For local development
- `.env.staging` - For staging environment
- `.env.production` - For production

Then load the appropriate one in `main.dart`:

```dart
// Development
await dotenv.load(fileName: ".env.development");

// Production
await dotenv.load(fileName: ".env.production");
```

## After Creating the `.env` File

Run the following commands:

```bash
# Install the new package
flutter pub get

# Restart your app
flutter run -d chrome
# or
flutter run -d macos
```

## Accessing Environment Variables in Code

You can access env variables anywhere in your app:

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Get a value
String apiUrl = dotenv.env['API_BASE_URL'] ?? 'default_value';

// Check if a variable exists
if (dotenv.env.containsKey('API_KEY')) {
  String apiKey = dotenv.env['API_KEY']!;
}
```

## Adding New Variables

1. Add to your `.env` file:
   ```
   NEW_VARIABLE=value
   ```

2. Add to `.env.example` (with placeholder):
   ```
   NEW_VARIABLE=your_value_here
   ```

3. Use in your code:
   ```dart
   String myVar = dotenv.env['NEW_VARIABLE'] ?? 'default';
   ```

## Troubleshooting

### "Unable to load asset: .env"
- Make sure the `.env` file exists in the project root
- Verify it's listed in `pubspec.yaml` under `assets:`
- Run `flutter clean` and `flutter pub get`

### Environment variable is null
- Check spelling in the `.env` file
- Ensure no spaces around the `=` sign
- Make sure the app was restarted after changing `.env`

### Changes not reflecting
- Restart the app completely (hot reload won't work for env changes)
- Run `flutter clean` and rebuild

---

## Summary

✅ **What's Done:**
- `flutter_dotenv` package added to `pubspec.yaml`
- `.env` added to assets in `pubspec.yaml`
- `api_service.dart` updated to read from environment variables
- `main.dart` updated to load `.env` file on startup

📝 **What You Need to Do:**
1. Create the `.env` file with your API URL
2. Run `flutter pub get`
3. Restart your app

🚀 **Your API Configuration:**
- Signup endpoint: `http://localhost:3001/api/v1/auth/signup`
- Base URL: `http://localhost:3001/api/v1`

