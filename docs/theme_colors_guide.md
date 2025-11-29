# دليل إضافة ألوان للـ Dark Theme و Light Theme

## نظرة عامة

التطبيق يستخدم نظام `ThemeExtension` من Flutter لإدارة الألوان بشكل احترافي. هذا يعني أن الألوان تتغير تلقائياً عند التبديل بين الوضع الفاتح والداكن بدون الحاجة لفحص `isDark` في كل مكان.

## البنية الأساسية

```
lib/core/theme/
├── app_colors.dart           # الألوان الثابتة (Primary, Success, Error, etc.)
├── app_colors_theme.dart     # ThemeExtension للألوان المتغيرة
└── theme_modes/
    ├── light_mode.dart       # إعدادات الوضع الفاتح
    └── dark_mode.dart        # إعدادات الوضع الداكن
```

---

## خطوات إضافة لون جديد

### الخطوة 1️⃣: إضافة اللون في `AppColorsTheme`

افتح الملف: `lib/core/theme/app_colors_theme.dart`

1. **أضف property جديد في الـ class:**

```dart
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  // الألوان الموجودة...
  final Color cardBackground;
  final Color primaryText;
  
  // ✅ أضف اللون الجديد هنا
  final Color newFeatureBackground;  // مثال: لون خلفية feature جديد
  
  const AppColorsTheme({
    required this.cardBackground,
    required this.primaryText,
    // ✅ أضفه في الـ constructor
    required this.newFeatureBackground,
  });
```

2. **أضف اللون في دالة `copyWith()`:**

```dart
@override
ThemeExtension<AppColorsTheme> copyWith({
  Color? cardBackground,
  Color? primaryText,
  Color? newFeatureBackground,  // ✅ أضفه هنا
}) {
  return AppColorsTheme(
    cardBackground: cardBackground ?? this.cardBackground,
    primaryText: primaryText ?? this.primaryText,
    newFeatureBackground: newFeatureBackground ?? this.newFeatureBackground,  // ✅ وهنا
  );
}
```

3. **أضف اللون في دالة `lerp()`:**

```dart
@override
ThemeExtension<AppColorsTheme> lerp(
  covariant ThemeExtension<AppColorsTheme>? other,
  double t,
) {
  if (other is! AppColorsTheme) {
    return this;
  }

  return AppColorsTheme(
    cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
    primaryText: Color.lerp(primaryText, other.primaryText, t)!,
    newFeatureBackground: Color.lerp(newFeatureBackground, other.newFeatureBackground, t)!,  // ✅ وهنا
  );
}
```

---

### الخطوة 2️⃣: إضافة اللون في Light Theme

افتح الملف: `lib/core/theme/theme_modes/light_mode.dart`

ابحث عن `extensions: [` وأضف اللون:

```dart
ThemeData getLightModeTheme() {
  return ThemeData(
    // ... الإعدادات الأخرى
    
    extensions: [
      AppColorsTheme(
        containerBackground: const Color(0xFFE3E5EA),
        cardBackground: Colors.white,
        primaryText: Colors.black,
        // ✅ أضف اللون للـ Light Mode
        newFeatureBackground: const Color(0xFFF5F5F5),  // مثال: رمادي فاتح
      ),
    ],
  );
}
```

---

### الخطوة 3️⃣: إضافة اللون في Dark Theme

افتح الملف: `lib/core/theme/theme_modes/dark_mode.dart`

ابحث عن `extensions: [` وأضف اللون:

```dart
ThemeData getDarkModeTheme() {
  return ThemeData(
    // ... الإعدادات الأخرى
    
    extensions: const [
      AppColorsTheme(
        containerBackground: AppColors.surfaceVariant,
        cardBackground: AppColors.surfaceVariant,
        primaryText: Colors.white,
        // ✅ أضف اللون للـ Dark Mode
        newFeatureBackground: Color(0xFF2A2A2A),  // مثال: رمادي داكن
      ),
    ],
  );
}
```

---

### الخطوة 4️⃣: إضافة getter في BuildContext Extension (اختياري)

إذا كنت تريد الوصول للون بطريقة سهلة مثل `context.newFeatureBackground`

افتح الملف: `lib/core/extensions/theme_extension.dart`

```dart
extension ThemeExtension on BuildContext {
  AppColorsTheme get _colors => Theme.of(this).extension<AppColorsTheme>()!;
  
  // الـ getters الموجودة...
  Color get cardBackground => _colors.cardBackground;
  Color get primaryText => _colors.primaryText;
  
  // ✅ أضف getter جديد
  Color get newFeatureBackground => _colors.newFeatureBackground;
}
```

---

### الخطوة 5️⃣: استخدام اللون في الـ UI

الآن يمكنك استخدام اللون في أي widget:

#### الطريقة 1: مباشرة من الـ extension (موصى بها)

```dart
Container(
  color: context.newFeatureBackground,  // ✅ سهل وواضح
  child: Text('Hello'),
)
```

#### الطريقة 2: من خلال Theme مباشرة

```dart
Container(
  color: Theme.of(context).extension<AppColorsTheme>()!.newFeatureBackground,
  child: Text('Hello'),
)
```

---

## أمثلة عملية

### مثال 1: إضافة لون لخلفية الـ Bottom Sheet

```dart
// 1️⃣ في app_colors_theme.dart
final Color bottomSheetBackground;

// 2️⃣ في light_mode.dart
bottomSheetBackground: Colors.white,

// 3️⃣ في dark_mode.dart
bottomSheetBackground: Color(0xFF1E1E1E),

// 4️⃣ في theme_extension.dart
Color get bottomSheetBackground => _colors.bottomSheetBackground;

// 5️⃣ في الـ UI
showModalBottomSheet(
  backgroundColor: context.bottomSheetBackground,  // ✅
  context: context,
  builder: (context) => YourWidget(),
);
```

### مثال 2: إضافة لون للـ Chip/Badge

```dart
// 1️⃣ في app_colors_theme.dart
final Color chipBackground;
final Color chipText;

// 2️⃣ في light_mode.dart
chipBackground: Color(0xFFE3F2FD),
chipText: Color(0xFF1976D2),

// 3️⃣ في dark_mode.dart
chipBackground: Color(0xFF1E3A5F),
chipText: Color(0xFF64B5F6),

// 4️⃣ في theme_extension.dart
Color get chipBackground => _colors.chipBackground;
Color get chipText => _colors.chipText;

// 5️⃣ في الـ UI
Chip(
  backgroundColor: context.chipBackground,
  label: Text('New', style: TextStyle(color: context.chipText)),
)
```

---

## الألوان الموجودة حالياً

يمكنك استخدام هذه الألوان مباشرة:

### الخلفيات والأسطح
- `context.containerBackground` - خلفية الـ containers
- `context.cardBackground` - خلفية الـ cards
- `context.cardBorderColor` - لون حواف الـ cards
- `context.cardShadow` - ظل الـ cards (List<BoxShadow>)

### النصوص
- `context.primaryText` - النص الأساسي
- `context.mainText` - النص الرئيسي
- `context.secondaryText` - النص الثانوي

### الأيقونات
- `context.iconColor` - لون الأيقونات

### حالات النجاح (Success)
- `context.successBackground` - خلفية حالة النجاح
- `context.successPrimary` - اللون الأساسي للنجاح
- `context.successText` - نص النجاح

### حالات الخطأ (Error)
- `context.errorBackground` - خلفية حالة الخطأ
- `context.errorText` - نص الخطأ

### أخرى
- `context.infoColor` - لون المعلومات
- `context.divider` - لون الفواصل
- `context.toggleBackground` - خلفية الـ toggle switch

---

## ⚠️ أخطاء شائعة وكيفية تجنبها

### ❌ خطأ: استخدام isDark يدوياً

```dart
// ❌ لا تفعل هذا
final color = context.isDarkMode ? Colors.white : Colors.black;
```

```dart
// ✅ افعل هذا بدلاً منه
final color = context.primaryText;  // يتغير تلقائياً حسب الـ theme
```

### ❌ خطأ: نسيان إضافة اللون في أحد الملفات

يجب إضافة اللون في **الأربع أماكن**:
1. `app_colors_theme.dart` (property)
2. `app_colors_theme.dart` (copyWith)
3. `app_colors_theme.dart` (lerp)
4. `light_mode.dart` (قيمة Light)
5. `dark_mode.dart` (قيمة Dark)

إذا نسيت أي مكان، سيظهر error في الـ compile.

### ❌ خطأ: استخدام ألوان ثابتة في الـ UI

```dart
// ❌ لا تفعل هذا
Container(color: Colors.white)  // لن يتغير مع الـ theme
```

```dart
// ✅ افعل هذا
Container(color: context.cardBackground)  // يتغير تلقائياً
```

---

## نصائح مهمة

### 1. متى تستخدم `AppColors` ومتى تستخدم `context.color`؟

**استخدم `AppColors`** للألوان الثابتة التي لا تتغير:
- `AppColors.primary` - اللون الأساسي للتطبيق
- `AppColors.errorPrimary` - لون الخطأ الثابت

**استخدم `context.color`** للألوان المتغيرة حسب الـ theme:
- `context.cardBackground` - يتغير من أبيض لداكن
- `context.primaryText` - يتغير من أسود لأبيض

### 2. الألوان مع الشفافية (Opacity)

```dart
// ✅ صح
context.cardBackground.withValues(alpha: 0.5)

// أو
context.cardBackground.withOpacity(0.5)  // deprecated but works
```

### 3. التعامل مع Gradients

```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        context.cardBackground,
        context.containerBackground,
      ],
    ),
  ),
)
```

---

## اختبار الألوان

بعد إضافة لون جديد، تأكد من:

1. ✅ التطبيق يعمل بدون أخطاء
2. ✅ اللون يظهر صحيح في Light Mode
3. ✅ اللون يظهر صحيح في Dark Mode
4. ✅ الانتقال بين الـ themes سلس وبدون مشاكل
5. ✅ اللون واضح ومقروء في كلا الوضعين

### كيفية الاختبار:

```dart
// في أي شاشة، أضف زر للتبديل
IconButton(
  icon: Icon(Icons.brightness_6),
  onPressed: () {
    context.read<ThemeCubit>().toggleTheme(context.isDarkMode);
  },
)
```

---

## أسئلة شائعة (FAQ)

### س: هل يمكن إضافة ألوان مختلفة لكل feature؟

نعم! يمكنك إنشاء `ThemeExtension` منفصل لكل feature كبير إذا أردت:

```dart
class MarketThemeExtension extends ThemeExtension<MarketThemeExtension> {
  final Color chartLineColor;
  final Color priceUpColor;
  final Color priceDownColor;
  // ...
}
```

### س: ماذا لو أردت لون يعتمد على شرط معين وليس فقط dark/light؟

استخدم logic في الـ widget نفسه:

```dart
final color = isSuccess 
    ? context.successBackground 
    : context.errorBackground;
```

### س: هل يمكن الوصول للـ theme colors خارج BuildContext؟

لا، تحتاج `BuildContext`. لكن يمكنك تمرير اللون كـ parameter:

```dart
void someFunction(Color backgroundColor) {
  // استخدم backgroundColor هنا
}

// في الـ widget
someFunction(context.cardBackground);
```

---

## الخلاصة

✅ **إضافة لون جديد = 5 خطوات بسيطة**

1. أضف property في `AppColorsTheme`
2. أضف في `copyWith()` و `lerp()`
3. حدد قيمة للـ Light Mode
4. حدد قيمة للـ Dark Mode
5. (اختياري) أضف getter في `theme_extension.dart`

✅ **استخدم الألوان بطريقة سهلة:**
```dart
context.colorName  // ✅ الطريقة الموصى بها
```

✅ **لا تستخدم `isDark` يدوياً للألوان** - دع الـ theme يتعامل معها تلقائياً!

---

## للمزيد من المساعدة

إذا واجهت مشكلة:
1. تأكد من إضافة اللون في كل الأماكن المطلوبة
2. راجع الأمثلة الموجودة في الكود
3. اسأل الفريق على Slack/Teams

Happy Theming! 🎨✨

