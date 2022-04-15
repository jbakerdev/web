const defaultTheme = require('tailwindcss/defaultTheme')

// Cribbed from: https://tailwindcss.com/docs/customizing-colors#using-css-variables
function withOpacityValue(variable) {
  return ({ opacityValue }) => {
    if (opacityValue === undefined) {
      return `rgb(var(${variable}))`
    }
    return `rgb(var(${variable}) / ${opacityValue})`
  }
}

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
      current:     'currentColor',

      // Solarized Palette
      black:       withOpacityValue('--color-black'),
      base03:      withOpacityValue('--color-base03'),
      base02:      withOpacityValue('--color-base02'),
      base01:      withOpacityValue('--color-base01'),
      base00:      withOpacityValue('--color-base00'),
      base0:       withOpacityValue('--color-base0'),
      base1:       withOpacityValue('--color-base1'),
      base2:       withOpacityValue('--color-base2'),
      base3:       withOpacityValue('--color-base3'),
      white:       withOpacityValue('--color-white'),
      yellow:      withOpacityValue('--color-yellow'),
      orange:      withOpacityValue('--color-orange'),
      red:         withOpacityValue('--color-red'),
      magenta:     withOpacityValue('--color-magenta'),
      violet:      withOpacityValue('--color-violet'),
      blue:        withOpacityValue('--color-blue'),
      cyan:        withOpacityValue('--color-cyan'),
      green:       withOpacityValue('--color-green'),

      // Dynamic Palette
      solar1:      withOpacityValue('--color-solar1'),
      solar2:      withOpacityValue('--color-solar2'),
      solar3:      withOpacityValue('--color-solar3'),
      solar4:      withOpacityValue('--color-solar4'),
      solar5:      withOpacityValue('--color-solar5'),
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
