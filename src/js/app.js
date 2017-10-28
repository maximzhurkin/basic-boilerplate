var initFonts;

initFonts = function() {
  WebFont.load({
    google: {
      families: ['Gabriela:latin,cyrillic', 'Roboto:100,300,700:latin,cyrillic']
    }
  });
};

$(document).ready(function() {
  initFonts();
});
