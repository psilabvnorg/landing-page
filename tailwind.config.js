/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      colors: {
        'psi-blue': '#3498db',
        'psi-dark': '#2c3e50',
        'psi-purple': '#667eea',
        'psi-violet': '#764ba2',
      },
      fontFamily: {
        sans: ['Segoe UI', 'Tahoma', 'Geneva', 'Verdana', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
