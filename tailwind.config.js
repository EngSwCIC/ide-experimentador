/** @type {import('tailwindcss').Config} */
module.exports = {
  mode: 'jit', // Enable the just-in-time mode for faster development
  purge: [  "./app/**/*.html.erb",
            "./app/helpers/**/*.rb",
            "./app/javascript/**/*.js",
            "./app/javascript/**/*.vue",], // Files to scan for classes
  darkMode: false, // Set to 'media' or 'class' if you want dark mode support
  theme: {
    extend: {
      colors: {
        // Add any custom colors here
        gray: {
          '100': '#f7fafc',
          '800': '#2d3748',
        },
        // Add more custom colors if needed
      },
      // Extend or override default Tailwind settings here
    },
  },
  variants: {
    extend: {
      // Add any additional variants you want to customize
    },
  },
  plugins: [
    // Add any custom plugins or third-party plugins here
  ],
};

