/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{inc,html}",
  ],
  theme: {
    extend: {
      fontFamily: {
        'base': '"Helvetica Now Text", Helvetica, Arial, sans-serif',
        'nike':  ['"Nike Futura ND"', 'sans-serif'],
      },
      colors: {
        'white-color': 'var(--clr-white)',
        'black-color': 'var(--clr-black)',
        'grey-color': 'var(--clr-grey)',
        'light-grey-color': 'var(--clr-light-grey)',
      },
      boxShadow: {
        'customMobile': '1px -89px 70px -23px rgba(0,0,0,0.75) inset;',
        'customPC': '1px -300px 70px -23px rgba(0,0,0,0.75) inset;',
        'custom': '1px -200px 70px -23px rgba(0,0,0,0.75) inset;',
      }
  },
  },
  plugins: [],
}

