const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'media',
  content: [
    './app/components/**/*',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],  
  theme: {
    colors: {
      transparent: 'transparent',
      current:   'currentColor',
      black:     '#000000',
      base03:    '#002b36',
      base02:    '#073642',
      base01:    '#586e75',
      base00:    '#657b83',
      base0:     '#839496',
      base1:     '#93a1a1',
      base2:     '#eee8d5',
      base3:     '#fdf6e3',
      white:     '#ffffff',
      yellow:    '#b58900',
      orange:    '#cb4b16',
      red:       '#dc322f',
      magenta:   '#d33682',
      violet:    '#6c71c4',
      blue:      '#268bd2',
      cyan:      '#2aa198',
      green:     '#859900',
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
