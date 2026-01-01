# PSI Technology - Modern Landing Page

A modern, responsive website showcasing PSI Technology and team member profiles, built with Tailwind CSS and Flowbite components.

## 🎨 Design Features

- **Modern UI** with glassmorphism effects
- **Animated gradient backgrounds** with floating orbs
- **3D hover effects** on cards and buttons
- **Backdrop blur navigation** that changes on scroll
- **Gradient borders** on project cards
- **Ripple animations** on buttons
- **Fully responsive** design for all devices

## Quick Start

### Prerequisites
- Node.js and npm installed
- Git (for version control)

### Local Development

1. **Clone the repository**
```bash
git clone [your-repo-url]
cd landing-page
```

2. **Install dependencies**
```bash
npm install
```

3. **Build CSS**
```bash
npm run build
```

4. **For development with auto-rebuild**
```bash
npm run dev
```

5. **Open in browser**
   - Open `index.html` in your browser
   - Or use a local server: `python3 -m http.server 8005`

## File Structure

```
/
├── src/
│   └── input.css          # Tailwind source CSS
├── dist/
│   └── output.css         # Compiled CSS (generated)
├── node_modules/          # Dependencies (auto-generated)
├── index.html             # Main company page
├── cuong.html            # Cuong's profile page
├── duy.html              # Duy's profile page  
├── tung.html             # Tung's profile page
├── package.json          # Dependencies & scripts
├── tailwind.config.js    # Tailwind configuration
├── company_logo.png      # Company logo
├── .gitignore            # Git ignore rules
├── TAILWIND_SETUP.md     # Detailed setup guide
├── QUICK_REFERENCE.md    # Common patterns
└── README.md             # This file
```
## 🎯 Features

### Design Elements
- **Hero Section**: Animated gradient with pulsing orbs and grid pattern
- **Team Cards**: Glassmorphic design with smooth hover effects
- **Project Cards**: Gradient borders with 3D transforms
- **Navigation**: Backdrop blur that enhances on scroll
- **Buttons**: Gradient backgrounds with ripple animations

### Responsive Breakpoints
- Mobile: < 768px (single column)
- Tablet: 768px - 1024px (2 columns)
- Desktop: > 1024px (3 columns)

## Customization

### Colors
Edit `tailwind.config.js` to change brand colors:
```js
colors: {
  'psi-blue': '#3498db',
  'psi-dark': '#2c3e50',
  'psi-purple': '#667eea',
  'psi-violet': '#764ba2',
}
```

### Custom Styles
Add custom CSS in `src/input.css` under `@layer components`

### Content
- Update team information in HTML files
- Modify project details in `index.html`
- Change contact information
- Replace `company_logo.png`

## 📝 Development Commands

```bash
npm run build    # Build production CSS (minified)
npm run dev      # Watch mode for development
```

## 🔧 Technologies Used

- **HTML5** - Semantic markup
- **Tailwind CSS v3.4+** - Utility-first CSS framework
- **Flowbite v2.2+** - Interactive components
- **JavaScript** - Scroll detection and interactions
- **CSS Grid & Flexbox** - Responsive layouts

## Important Notes

1. Always run `npm run build` after HTML changes
2. Don't edit `dist/output.css` directly (auto-generated)
3. Keep `node_modules/flowbite/` for interactive components
4. Old `styles.css` is deprecated (use Tailwind classes)

## License

© 2025 PSI Technology. All rights reserved.
